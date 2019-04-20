;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017 Caleb Ristvedt <caleb.ristvedt@cune.org>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

;;; For building derivations.

(define-module (guix store build-derivations)
  #:use-module (guix derivations)
  #:use-module (guix store)
  #:use-module (guix store database)
  #:use-module (guix config)
  #:use-module (guix build syscalls)
  #:use-module (ice-9 vlist)
  #:use-module (ice-9 popen)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-11)
  #:use-module (gcrypt hash)
  #:use-module (guix serialization)
  #:use-module (guix base16)
  #:use-module (guix sets)
  #:use-module ((guix build utils) #:select (delete-file-recursively
                                             mkdir-p
                                             copy-recursively))
  #:use-module (guix build store-copy)
  #:use-module (gnu system file-systems)
  #:use-module (gnu build linux-container)
  #:use-module (ice-9 textual-ports)
  #:use-module (ice-9 match)
  #:use-module (rnrs io ports)
  #:use-module (ice-9 rdelim)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 q)
  #:use-module (srfi srfi-43)
  #:use-module (rnrs bytevectors)
  #:export (build-derivation))


(define-record-type <build-environment>
  (make-build-environment drv build-dir-inside build-dir env-vars input-paths
                          filesystems user group)
  build-environment?
  (drv        build-environment-derivation) ; <derivation> this is for.
  (build-dir-inside build-directory-inside) ; path of chroot directory.
  (build-dir  build-directory)              ; build dir (outside chroot).
  (env-vars   build-environment-variables)  ; alist of environment variables.
  (input-paths build-input-paths)           ; list of paths or pairs of paths.
  (filesystems build-filesystems)           ; list of <file-system> objects.
  (user        build-environment-user)      ; the user id to build with.
  (group       build-environment-group))    ; the group id to build with.      


;;; The derivation building process:
;;; 1. Build inputs if necessary.
;;; 2. Make a build directory under TMPDIR or /tmp
;;; 3. Gather all the inputs and sources and anything they transitively
;;; reference and put them in the store in the chroot directory.
;;; 4. Make an output directory for the build under /gnu/store in the build
;;; directory.
;;; 5. Set all the environment variables listed in the derivation, some of
;;; which we have to honor ourselves, like "preferLocalBuild",
;;; "allowSubstitutes", "allowedReferences", "disallowedReferences", and
;;; "impureEnvVars".
;;; 6. Run the builder in a chroot where the build directory is the root.


(define (output-paths drv)
  "Returns all store output paths produced by DRV."
  (match (derivation-outputs drv)
    (((outid . ($ <derivation-output> output-path)) ...)
     output-path)))

(define (get-output-specs drv possible-references)
  "Returns a list of <store-info> objects, one for each output of DRV."
  (map (match-lambda
         ((outid . ($ <derivation-output> output-path))
          (let ((references
                 (scan-for-references output-path
                                      ;; outputs can reference
                                      ;; themselves or other outputs of
                                      ;; the same derivation.
                                      (append (output-paths drv)
                                              possible-references))))
            (store-info output-path (derivation-file-name drv) references))))
       (derivation-outputs drv)))

(define (builtin-download drv)
  ((@@ (guix scripts perform-download) perform-download) drv)
  (get-output-specs drv (all-transitive-inputs drv)))

;; if a derivation builder name is in here, it is a builtin. For normal
;; behavior, make sure everything starts with "builtin:". Also, the procedures
;; stored in here should take a single argument, the derivation.

(define builtins
  (let ((builtins-table (make-hash-table 10)))
    (hash-set! builtins-table
               "builtin:download"
               builtin-download)
    builtins-table))

;; We might want to add to this sometime.
(define %default-chroot-dirs
  '())

(define* (build-directory-name drv #:optional
                               (attempt 0)
                               (temp-directory %temp-directory))
  (string-append temp-directory
                 "/guix-build-"
                 (store-path-package-name (derivation-file-name drv))
                 "-"
                 (number->string attempt)))

(define* (make-build-directory drv #:optional (temp-directory %temp-directory))
  (let try-again ((attempt-number 0))
    (catch 'system-error
      (lambda ()
        (let ((build-dir (build-directory-name drv
                                               attempt-number
                                               temp-directory)))
          (mkdir build-dir #o0700)
          build-dir))
      (lambda args
        (if (= (system-error-errno args) EEXIST)
            (try-again (+ attempt-number 1))
            (throw args))))))


(define (build-environment-vars drv in-chroot-build-dir)
  "Returns an alist of environment variable / value pairs for every
environment variable that should be set during the build execution."
  (let ((leaked-vars (and
                      (fixed-output-derivation? drv)
                      (let ((leak-string
                             (assoc-ref (derivation-builder-environment-vars drv)
                                        "impureEnvVars")))
                        (and leak-string
                             (string-tokenize leak-string
                                              (char-set-complement
                                               (char-set #\space))))))))
    (append `(("PATH"             .  "/path-not-set")
              ("HOME"             .  "/homeless-shelter")
              ("NIX_STORE"        .  ,%store-directory)
              ;; XXX: make this configurable
              ("NIX_BUILD_CORES"  .  "0")
              ("NIX_BUILD_TOP"    .  ,in-chroot-build-dir)
              ;; why yes that is something like /tmp/guix-build-<drv>-0, yes
              ;; indeed it does not make much sense to make that the TMPDIR
              ;; instead of /tmp, and no I do not know why the C++ code does it
              ;; that way.
              ("TMPDIR"           .  ,in-chroot-build-dir)
              ("TEMPDIR"          .  ,in-chroot-build-dir)
              ("TMP"              .  ,in-chroot-build-dir)
              ("TEMP"             .  ,in-chroot-build-dir)
              ("PWD"              .  ,in-chroot-build-dir))
            (if (fixed-output-derivation? drv)
                '(("NIX_OUTPUT_CHECKED" . "1"))
                '())
            (if leaked-vars
                ;; leaked vars might not be defined.
                (filter cdr
                        (map (lambda (leaked-var)
                               (cons leaked-var (getenv leaked-var)))
                             leaked-vars))
                '())
            (derivation-builder-environment-vars drv))))

(define (default-files drv)
  "Returns a list of the files to be bind-mounted that aren't store items or
already added by call-with-container."
  `(,@(if (file-exists? "/dev/kvm")
          '("/dev/kvm")
          '())
    ,@(if (fixed-output-derivation? drv)
          '("/etc/resolv.conf"
            "/etc/nsswitch.conf"
            "/etc/services"
            "/etc/hosts")
          '())))

;; yes, there is most likely already something that does this.
(define (format-file file-name . args)
  (call-with-output-file file-name
    (lambda (port)
      (apply simple-format port args))))

(define* (mkdir-p* dir #:optional permissions)
  (mkdir-p dir)
  (when permissions
    (chmod dir permissions)))

(define (add-core-files environment)
  "Creates core files that will not vary when the derivation is constant. That
is, whether these files are present or not is influenced solely by the
derivation itself."
  (let ((uid (build-environment-user environment))
        (gid (build-environment-group environment)))
    (mkdir-p* %store-directory #o1775)
    (chown %store-directory uid gid)
    (mkdir-p* "/tmp" #o1777)
    (mkdir-p* "/etc")

    (format-file "/etc/passwd"
                 (string-append "nixbld:x:~a:~a:Nix build user:/:/noshell~%"
                                "nobody:x:65534:65534:Nobody:/:/noshell~%")
                 uid gid)
    (format-file "/etc/group"
                 "nixbld:!:~a:~%"
                 (build-environment-group environment))
    (unless (fixed-output-derivation?
             (build-environment-derivation environment))
      (format-file "/etc/hosts" "127.0.0.1 localhost~%"))))

(define (path-already-assigned? path paths)
  "Determines whether something is already going to be bind-mounted to PATH
based on what is in PATHS, which should be a list of paths or path pairs."
  (find (match-lambda
          ((source . target)
           (string= target path))
          (target
           (string= target path)))
        paths))



(define* (prepare-build-environment drv #:key
                                    build-chroot-dirs 
                                    (extra-chroot-dirs '())
                                    (build-user (getuid))
                                    (build-group (getgid)))
  "Creates a <build-environment> for the derivation DRV. BUILD-CHROOT-DIRS
will override the default chroot directories, EXTRA-CHROOT-DIRS will
not. Those two arguments should be #f or lists of either file names or pairs
of file names of the form (outside . inside). Returns the <build-environment>
and a list of all the files in the store that could be referenced."
  (let* ((build-dir (make-build-directory drv))
         (build-dir-inside (build-directory-name drv 0 "/tmp"))
         (env-vars (build-environment-vars drv build-dir-inside))
         (inputs-from-store (all-transitive-inputs drv))
         ;; use "or" here instead of having a default value so that passing #f
         ;; works.
         (all-inputs `(,@(or build-chroot-dirs
                             %default-chroot-dirs)
                       ,@extra-chroot-dirs
                       ,@(default-files drv)
                       ,(cons build-dir
                              build-dir-inside)
                       ,@inputs-from-store
                       ,@(derivation-sources drv))))
    ;;
    ;; TODO: Honor "environment variables" passed through the derivation.
    ;; these include "impureEnvVars", "exportReferencesGraph",
    ;; "allowSubstitutes", "allowedReferences", "disallowedReferences"
    ;; "preferLocalBuild".
    (chown build-dir build-user build-group)
    (values
     (make-build-environment drv build-dir-inside build-dir env-vars
                             all-inputs
                             (special-filesystems all-inputs)
                             build-user
                             build-group)
     inputs-from-store)))


(define (all-input-output-paths drv)
  "Returns a list containing the output paths this derivation's inputs need to
provide."
  (fold (lambda (input output-paths)
          (append (derivation-input-output-paths input)
                  output-paths))
        '()
        (derivation-inputs drv)))

;; Which store items should be included? According to the nix daemon, these
;; are:
;; - the relevant outputs of the inputs
;; - everything referenced (direct/indirect) by the relevant outputs of the
;;   inputs
;; - the sources
;; - everything referenced (direct/indirect) by the sources
;;
;; Importantly, this doesn't mention recursive inputs. Only direct inputs.
(define (all-transitive-inputs drv)
  "Produces a list of all inputs and all of their references."
  (let ((input-paths (all-input-output-paths drv)))
    (vhash-fold (lambda (key val prev)
                  (cons key prev))
                '()
                (fold (lambda (input list-so-far)
                        (file-closure input #:list-so-far list-so-far))
                      vlist-null
                      `(
                        ,@(derivation-sources drv)
                        ,@input-paths)))))

(define (special-filesystems input-paths)
  "Returns whatever new filesystems need to be created in the container, which
depends on whether they're already set to be bind-mounted. INPUT-PATHS must be
a list of paths or pairs of paths."
  ;; procfs is already taken care of by call-with-container
  `(,@(if (file-exists? "/dev/shm")
          (list (file-system
                  (device "none")
                  (mount-point "/dev/shm")
                  (type "tmpfs")
                  (check? #f)))
          '())
    
    ;; Indicates CONFIG_DEVPTS_MULTIPLE_INSTANCES=y in the kernel.
    ,@(if (and (file-exists? "/dev/pts/ptmx")
               ;; This check is fishy
               (not (path-already-assigned? "/dev/ptmx"
                                            input-paths))
               (not (path-already-assigned? "/dev/pts"
                                            input-paths)))
          (list (file-system
                  (device "none")
                  (mount-point "/dev/pts")
                  (type "devpts")
                  (options "newinstance,mode=0620")
                  (check? #f)))
          '())
    ))

(define (disable-address-randomization)
  (let ((current-persona (personality #xffffffff)))
    (personality (logior current-persona
                         ADDR_NO_RANDOMIZE))))

(define (enact-build-environment build-environment)
  "Makes the <build-environment> BUILD-ENVIRONMENT current by setting the
environment variables and bind-mounting the listed files. Importantly, this
assumes that it is in a separate namespace at this point."
  ;; warning: the order in which a lot of this happens is significant and
  ;; partially based on guesswork / copying what the c++ does.
  (setsid)
  (add-core-files build-environment)
  ;; local communication within the build environment should still be
  ;; possible.
  (initialize-loopback)
  ;; This couldn't really be described by a <file-system> object, so we have
  ;; to do this extra bit ourselves. 
  (when (find (lambda (fs)
                (string=? (file-system-type fs) "devpts"))
              (build-filesystems build-environment))
    (symlink "/dev/pts/ptmx" "/dev/ptmx")
    (chmod "/dev/pts/ptmx" #o0666))
  (environ (map (match-lambda
                  ((key . val)
                   (string-append key "=" val)))
                (build-environment-variables build-environment)))
  (sethostname "localhost")
  (disable-address-randomization)
  (setgid (build-environment-group build-environment))
  (setuid (build-environment-user build-environment))
  ;(close-most-files)
  (chdir (build-directory-inside build-environment)))

;; The C++ stuff does this, and in pursuit of a bug I will mindlessly mimic
;; anything.
(define (setup-i/o new-output)
  "Redirect output and error streams to LOG-PIPE and get input from
/dev/null, then close all other FDs."
  ;; 
  (redirect-port new-output (current-output-port))
  (redirect-port (current-output-port) (current-error-port))
  (call-with-input-file "/dev/null"
    (lambda (null-port)
      (dup2 (port->fdes null-port) 0)))
  (let close-next ((fd 3))
    ;; XXX: don't hardcode this.
    (when (<= fd 20)
      (false-if-exception (close-fdes fd))
      (close-next (1+ fd)))))

(define (inputs->mounts inputs)
  (map (match-lambda
         ((source . dest)
          (file-system
            (device source)
            (mount-point dest)
            (type "none")
            (flags '(bind-mount))
            (check? #f)))
         (source
          (file-system
            (device source)
            (mount-point source)
            (type "none")
            (flags '(bind-mount))
            (check? #f))))
       inputs))

(define (dump-port port)
  (unless (port-eof? port)
    (display (get-line port))
    (display "\n")
    (dump-port port)))

(define (open-builder-pipe environment)
  (let* ((drv (build-environment-derivation environment))
         (prog (derivation-builder drv))
         (args (derivation-builder-arguments drv)))
    (match (pipe)
      ((read-from . write-to)
       (match (primitive-fork)
         (0
          (close read-from)
          (enact-build-environment environment)
          (setup-i/o write-to)
          (when (stat "/dev/tty")
            (format #t "/dev/tty exists!~%"))
          (apply execl prog (basename prog) args))
         (child-pid
          (close write-to)
          (values read-from child-pid)))))))

(define (run-builder environment)
  "Runs the builder in the environment ENVIRONMENT."
  (let ((drv (build-environment-derivation environment)))
    (call-with-container
        (append (inputs->mounts (build-input-paths environment))
                (build-filesystems environment))
      (lambda ()
                                        ;(close-most-files)
        (format #t "command line: ~a~%"
                (cons (derivation-builder drv)
                      (derivation-builder-arguments drv)))
        (format #t "environment variables: ~a~%" (environ))
        
        (let-values (((read-side pid) (open-builder-pipe environment)))
          (dump-port read-side)
          (close read-side)
          (match (status:exit-val (cdr (waitpid pid)))
            (0
             0)
            (exit-val
             (throw 'build-failed-but-lets-debug exit-val drv)))))
      #:namespaces `(mnt pid ipc uts ,@(if (fixed-output-derivation? drv)
                                           '(net)
                                           '()))
      #:host-uids (1+ (build-environment-user environment))
      #:use-output (lambda (root)
                     (for-each (match-lambda
                                 ((outid . ($ <derivation-output> output-path))
                                  (copy-recursively (string-append root
                                                                   output-path)
                                                    output-path)))
                               (derivation-outputs drv))))))

;; I want to be able to test if a derivation's outputs exist without reading
;; it in. The database makes this possible. But we can't figure out WHICH
;; outputs it even has without reading it in. For most of the derivations, we
;; don't need to know which outputs it has, as long as we know the outputs we
;; want. Okay, okay, new plan: build-derivation takes a <derivation>, but
;; ensure-input-outputs-exist takes <derivation-input>
;; objects. build-derivation is only called when we know it needs to be built

(define (inputs-closure drv)
  "Given a <derivation> DRV, finds all store paths needed to build it."
  (fold (lambda (input prev)
          (fold (lambda (output outputs-list)
                  (cons output outputs-list))
                prev
                (derivation-input-output-paths input)))
        '()
        (derivation-prerequisites drv)))

(define (attempt-substitute drv)
  #f)

(define (maybe-use-builtin drv)
  "Uses a builtin builder to build DRV if it exists. Returns #f if there is no
builtin builder for DRV or it failed."
  (let ((builder (hash-ref builtins
                           (derivation-builder drv))))
    (if builder
        (begin
          ;; strip-store-file-name from (guix build utils), used by
          ;; perform-download indirectly, doesn't honor %store-directory. So
          ;; we have to set it here. ¯\_(ツ)_/¯
          (environ (map (match-lambda
                          ((key . val)
                           (string-append key "=" val)))
                        (build-environment-vars drv "/tmp")))
          (builder drv))
        #f)))



(define-record-type <trie-node>
  (make-trie-node table string-exists?)
  trie-node?
  ;; TODO implement skip values. Probably not as big a speed gain as you think
  ;; it is, since this is I/O-bound.
  ;; (skip-value node-skip-value set-skip-value!)
  (table node-table set-node-table!)
  ;; Technically speaking, it's possible for both CAT and CATTLE to be in a
  ;; trie at once. Of course, for our purposes, this is 
  (string-exists? node-string-exists? set-string-exists?!))

(define* (add-to-trie trie string #:optional (new-tables-size 2))
  "Adds STR to TRIE."
  (let ((str (string->utf8 string)))
    (let next-node ((position 0)
                    (current-node trie))
      (if (= position (bytevector-length str))
          ;; this is it. This is where we need to register that this string is
          ;; present.
          (set-string-exists?! current-node #t)
          (let* ((current-table (node-table current-node))
                 (node (hash-ref current-table
                                 (bytevector-u8-ref str position))))
            (if node
                (next-node (1+ position)
                           node)
                (let ((new-node (make-trie-node (make-hash-table new-tables-size)
                                                #f)))
                  (hash-set! current-table
                             (bytevector-u8-ref str position)
                             new-node)
                  (next-node (1+ position)
                             new-node))))))))

(define (make-search-trie strings)
  ;; TODO: make the first few trie levels non-sparse tables to avoid hashing
  ;; overhead. 
  (let ((root (make-trie-node (make-hash-table) #f)))
    (for-each (cut add-to-trie root <>)
              strings)
    root))


(define (remove-from-trie! trie sequence)
  "Removes SEQUENCE from TRIE. This means that any nodes that are only in the
path of SEQUENCE are removed. It's an error to use this with a sequence not
already in TRIE."
  ;; Hm. Looks like we'll have to recurse all the way down, find where it
  ;; ends, then stop at the first thing on the way back up that has anything
  ;; with the same prefix. Or I could do this the right way with an explicit
  ;; stack. Hm...
  
  (define (node-stack)
    (let next ((nodes '())
               (i 0)
               (current-node trie))
      (if (= (bytevector-length sequence) i)
          (begin
            ;; it's possible that even though this is the last node of this
            ;; sequence it can't be deleted. So mark it as not denoting a
            ;; string.
            (set-string-exists?! current-node #f)
            (cons current-node nodes))
          (let ((next-node (hash-ref (node-table current-node)
                                     (bytevector-u8-ref sequence i))))
            (next (cons current-node nodes)
                  (1+ i)
                  next-node)))))

  (let maybe-delete ((visited-nodes (node-stack))
                     (i (1- (bytevector-length sequence))))
    (match visited-nodes
      ((current parent others ...)
       (when (zero? (hash-count (const #t)
                                (node-table current)))

         (hash-remove! (node-table parent)
                       (bytevector-u8-ref sequence i))
         (maybe-delete (cdr visited-nodes)
                       (1- i))))
      ((current)
       #f))))

(define (scanning-wrapper-port output-port paths)
  "Creates a wrapper port which passes through bytes to OUTPUT-PORT and
returns it as well as a procedure which, when called, returns a list of all
references out of the possibilities enumerated in PATHS that were
detected. PATHS must not be empty."
  ;; Not sure if I should be using custom ports or soft ports...
  (let* ((strings (map store-path-hash-part paths))
         (string->path (fold (lambda (current prev)
                               (vhash-cons (store-path-hash-part current)
                                           current
                                           prev))
                             vlist-null
                             paths))
         (lookback-size (apply max (map (compose bytevector-length string->utf8)
                                        strings)))
         (smallest-length (apply min (map (compose bytevector-length
                                                   string->utf8)
                                          strings)))
         (lookback-buffer (make-bytevector lookback-size))
         (search-trie (make-search-trie strings))
         (buffer-pos 0)
         (references '()))
    
    (values
     (make-custom-binary-output-port
      "scanning-wrapper"
      ;; write
      (lambda (bytes offset count)
        (define (in-lookback? n)
          (< n buffer-pos))
        ;; the "virtual" stuff provides a convenient interface that makes it
        ;; look like we magically remember the end of the previous buffer.
        (define (virtual-ref n)
          (if (in-lookback? n)
              (bytevector-u8-ref lookback-buffer n)
              (bytevector-u8-ref bytes (+ (- n buffer-pos)
                                          offset))))
        

        (let ((total-length (+ buffer-pos count)))
          
          (define (virtual-copy! start end target)
            (let* ((copy-size (- end start)))
              (let copy-next ((i 0))
                (unless (= i copy-size)
                  (bytevector-u8-set! target
                                      i
                                      (virtual-ref (+ start i)))
                  (copy-next (1+ i))))
              target))

          ;; the gritty reality of that magic
          (define (remember-end)
            (let* ((copy-amount (min total-length
                                     lookback-size))
                   (start (- total-length copy-amount))
                   (end total-length))
              (virtual-copy! start end lookback-buffer)
              (set! buffer-pos copy-amount)))
          
          (define (attempt-match n trie)
            (let test-position ((i n)
                                (current-node trie))
              (if (node-string-exists? current-node)
                  ;; MATCH
                  (virtual-copy! n i (make-bytevector (- i n)))
                  (if (>= i total-length)
                      #f
                      (let ((next-node (hash-ref (node-table current-node)
                                                 (virtual-ref i))))
                        (if next-node
                            (test-position (1+ i)
                                           next-node)
                            #f))))))


                   
          (define (scan)
            (let next-char ((i 0))
              (when (< i (- total-length smallest-length))
                (let ((match-result (attempt-match i search-trie)))
                  (if match-result
                      (begin
                        (set! references
                          (let ((str-result
                                 (cdr (vhash-assoc (utf8->string match-result)
                                                   string->path))))
                            (format #t "Found reference to: ~a~%" str-result)
                            (cons str-result
                                  references)))
                        ;; We're not interested in multiple references, it'd
                        ;; just slow us down.
                        (remove-from-trie! search-trie match-result)
                        (next-char (+ i (bytevector-length match-result))))
                      (next-char (1+ i)))))))
          (format #t "Scanning chunk of ~a bytes~%" count)
          (scan)
          (remember-end)
          (put-bytevector output-port bytes offset count)
          count))
      #f ;; get-position
      #f ;; set-position
      (lambda ()
        (close-port output-port)))
     (lambda ()
       references))))


;; There are two main approaches we can use here: we can look for the entire
;; store path of the form "/gnu/store/hashpart-name", which will yield no
;; false positives and likely be faster due to being more quickly able to rule
;; out sequences, and we can look for just hashpart, which will be faster to
;; lookup and may both increase false positives and decrease false negatives
;; as stuff that gets split up will likely still have the hash part all
;; together, but adds a chance that 32 random base-32 characters could cause a
;; false positive, but the chances of that are extremely slim, and an
;; adversary couldn't really use that.
(define (scan-for-references file possibilities)
  "Scans for literal references in FILE as long as they happen to be in
POSSIBILITIES. Returns the list of references found, the sha256 hash of the
nar, and the length of the nar."
  (let*-values (((scanning-port get-references)
                 (scanning-wrapper-port (%make-void-port "w") possibilities)))
    (write-file file scanning-port)
    (force-output scanning-port)
    (get-references)))

;; XXX: make this configurable. Maybe I should read some more about those
;; parameters I've heard about...
(define %build-group (false-if-exception (group:gid (getgrnam "guixbuild"))))
(define %build-user-pool (and %build-group
                              (group:mem (getgrgid %build-group))))

;; every method of getting a derivation's outputs in the store needs to
;; provide 3 pieces of metadata: the size of the nar, the references of each
;; output, and the hash of each output. We happen to have ways of getting all
;; of those as long as we know which references to be looking for.
(define (topologically-sorted store-infos)
  "Returns STORE-INFOS in topological order or throws CYCLE-DETECTED if no
such order exists."
  (define path->store-info
    (let loop ((infos store-infos)
               (mapping vlist-null))
      (match infos
        ((($ (@@ (guix build store-copy) <store-info>)
             item deriver references) . tail)
         (loop tail (vhash-cons item (car infos) mapping)))
        (()
         (lambda (path)
           (let ((pair (vhash-assoc path mapping)))
             (and pair
                  (cdr pair))))))))

  (define (references-of store-info)
    ;; We need to pretend that self-references don't exist...
    (fold (lambda (current prev)
            (let ((info (path->store-info current)))
              (or (and (not (equal? info store-info))
                       info
                       (cons info prev))
                  prev)))
          '()
          (store-info-references store-info)))

  (reverse
   (let visit ((infos store-infos)
               (visited (set))
               (dependents (set))
               (result '()))
     (match infos
       ((head . tail)
        (if (set-contains? visited head)
            (if (set-contains? dependents head)
                (throw 'cycle-detected head)
                (visit tail visited dependents result))
            (call-with-values
                (lambda ()
                  (visit (references-of head)
                         (set-insert head visited)
                         (set-insert head dependents)
                         result))
              (lambda (result visited)
                (visit tail
                       visited
                       dependents
                       (cons head result))))))
       (()
        (values result visited))))))

(define (do-derivation-build drv)
  ;; inputs should all exist as of now
  (let-values (((build-env store-inputs)
                (prepare-build-environment drv
                                           #:extra-chroot-dirs '()
                                           #:build-user
                                           (or (and
                                                %build-user-pool
                                                ;; XXX: When implementing
                                                ;; scheduling, make it so this
                                                ;; searches for an unused
                                                ;; one.
                                                (passwd:uid
                                                 (getpwnam
                                                  (car %build-user-pool))))
                                               (getuid))
                                           #:build-group (or %build-group
                                                             (getgid)))))
    (if (zero? (run-builder build-env))
        (get-output-specs drv store-inputs)
        #f)))

(define (%build-derivation drv) 
  "Given a <derivation> DRV, builds/substitutes the derivation unconditionally
even if its outputs already exist."
  ;; Inputs need to exist regardless of how we're getting the outputs of this
  ;; derivation.
  (ensure-input-outputs-exist (derivation-inputs drv))
  (format #t "Starting build of derivation ~a~%~%" drv)
  (let ((output-specs
         (or (attempt-substitute drv)
             (maybe-use-builtin drv)
             (do-derivation-build drv))))
    (if output-specs
        (register-items (topologically-sorted output-specs))
        (throw 'derivation-build-failed drv))))

(define (ensure-input-outputs-exist inputs)
  (for-each
   (lambda (input)
     (let ((input-drv-path (derivation-input-path input)))
       (unless (outputs-exist? input-drv-path
                               (derivation-input-sub-derivations input))
         (%build-derivation (read-derivation-from-file input-drv-path)))))
   inputs))

(define* (build-derivation drv #:optional (outputs (derivation-output-names drv)))
  "Given a <derivation> DRV with desired outputs OUTPUTS, builds DRV if the
outputs don't already exist."
  (unless (outputs-exist? (derivation-file-name drv)
                          outputs)
    (%build-derivation drv)))



