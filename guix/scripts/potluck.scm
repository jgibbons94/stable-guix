;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017 Andy Wingo <wingo@pobox.com>
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

(define-module (guix scripts potluck)
  #:use-module (guix config)
  #:use-module (guix base32)
  #:use-module ((guix build-system) #:select (build-system-description))
  #:use-module ((guix licenses) #:select (license-uri))
  #:use-module (guix git)
  #:use-module (guix ui)
  #:use-module (guix utils)
  #:use-module (guix potluck build-systems)
  #:use-module (guix potluck licenses)
  #:use-module (guix potluck packages)
  #:use-module (guix scripts)
  #:use-module (guix scripts hash)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:use-module (srfi srfi-37)
  #:use-module (ice-9 format)
  #:use-module (ice-9 match)
  #:use-module (ice-9 pretty-print)
  #:use-module (json)
  #:use-module (web client)
  #:use-module (web response)
  #:use-module (web uri)
  #:export (guix-potluck))


;;;
;;; guix potluck init
;;;

(define* (init-potluck remote-git-url #:key
                       (build-system 'gnu) (autoreconf? #f)
                       (license 'gplv3+))
  (let* ((cwd (getcwd))
         (dot-git (in-vicinity cwd ".git"))
         (potluck-dir (in-vicinity cwd "potluck"))
         (package-name (basename cwd)))
    (unless (and (file-exists? dot-git)
                 (file-is-directory? dot-git))
      (leave (_ "init: must be run from the root of a git checkout~%")))
    (when (file-exists? potluck-dir)
      (leave (_ "init: ~a already exists~%") potluck-dir))
    (let* ((user-name (git-config "user.name"))
           (pkg-name (basename cwd))
           (pkg-commit (git-rev-parse "HEAD"))
           (pkg-version
            (catch #t
              (lambda () (git-describe pkg-commit))
              (lambda _
                (format (current-error-port)
                        "guix potluck init: git describe failed\n")
                (format (current-error-port)
                        "Add a tag so that git can compute a version.\n")
                (exit 1))))
           ;; FIXME: Race condition if HEAD changes between git-rev-parse and
           ;; here.
           (pkg-sha256 (guix-hash-git-checkout cwd)))
      (format #t (_ "Creating potluck/~%"))
      (mkdir potluck-dir)
      (format #t (_ "Creating potluck/README.md~%"))
      (call-with-output-file (in-vicinity potluck-dir "README.md")
        (lambda (port)
          (format port
                  "\
This directory defines potluck packages.  Each file in this directory should
define one package.  See https://potluck.guixsd.org/ for more information.
")))
      (format #t (_ "Creating potluck/~a.scm~%") package-name)
      (call-with-output-file (in-vicinity potluck-dir
                                          (string-append package-name ".scm"))
        (lambda (port)
          
          (define-syntax-rule (dsp exp) (display exp port))
          (dsp ";;; guix potluck package\n")
          (dsp ";;; Copyright (C) 2017 ")
          (dsp user-name)
          (dsp "\n")
          (dsp "
;;; This file is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.  No warranty.  See
;;; https://www.gnu.org/licenses/gpl.html for a copy of the GPLv3.

")
          (pretty-print-potluck-package
           port
           (potluck-package
            (name pkg-name)
            (version pkg-version)
            (source
             (potluck-source
              (git-uri remote-git-url)
              (git-commit pkg-commit)
              (sha256 (bytevector->nix-base32-string pkg-sha256))))
            (build-system build-system)
            (inputs '())
            (native-inputs
             (if autoreconf?
                 '("autoconf" "automake" "libtool" "pkg-config")
                 '()))
            (arguments
             (if autoreconf?
                 '(#:phases (modify-phases %standard-phases
                              (add-before 'configure 'autoconf
                                (lambda _
                                  (zero?
                                   (system* "autoreconf" "-vfi"))))))
                 '()))
            (home-page remote-git-url)
            (synopsis "Declarative synopsis here")
            (description
             (string-append (string-titlecase pkg-name)
                            " is a ..."))
            (license license)))))
      (format #t (_ "
Done.  Now open potluck/~a.scm in your editor, fill out its \"synopsis\" and
\"description\" fields, add dependencies to the 'inputs' field, and try to
build with

  guix build --file=potluck/~a.scm

When you get that working, commit your results to git via:

  git add guix-potluck && git commit -m 'Add initial Guix potluck files.'
") pkg-name pkg-name))))


;;;
;;; Options.
;;;

(define (show-help)
  (display (_ "Usage: guix potluck [OPTION ...] ACTION [ARG ...]
Create \"potluck\" packages, register them with a central service, and arrange
to serve those packages as a Guix channel. Some ACTIONS require additional
ARGS.\n"))
  (newline)
  (display (_ "The valid values for ACTION are:\n"))
  (newline)
  (display (_ "\
   init             create potluck recipe for current working directory\n"))

  (newline)
  (display (_ "The available OPTION flags are:\n"))
  (display (_ "
      --build-system=SYS for 'init', specify the build system.  Use
                         --build-system=help for all available options."))
  (display (_ "
      --autotools        for 'init', like --build-system=gnu but additionally
                         indicating that the package needs autoreconf before
                         running ./configure"))
  (display (_ "
      --license=LICENSE  for 'init', specify the license of the package.  Use
                         --license=help for all available options."))
  (display (_ "
      --verbosity=LEVEL  use the given verbosity LEVEL"))
  (newline)
  (display (_ "
  -h, --help             display this help and exit"))
  (display (_ "
  -V, --version          display version information and exit"))
  (newline)
  (show-bug-report-information))

(define %options
  ;; Specifications of the command-line options.
  (list (option '(#\h "help") #f #f
                (lambda args
                  (show-help)
                  (exit 0)))
        (option '(#\V "version") #f #f
                (lambda args
                  (show-version-and-exit "guix potluck")))
        (option '("build-system") #t #f
                (lambda (opt name arg result)
                  (alist-cons 'build-system arg result)))
        (option '("autotools") #f #f
                (lambda (opt name arg result)
                  (alist-cons 'autoreconf? #t
                              (alist-cons 'build-system "gnu" result))))
        (option '("license") #t #f
                (lambda (opt name arg result)
                  (alist-cons 'license arg result)))
        (option '("verbosity") #t #f
                (lambda (opt name arg result)
                  (alist-cons 'verbosity (string->number arg) result)))))

(define %default-options
  ;; Alist of default option values.
  `((verbosity . 0)))

(define (parse-url url-str)
  (unless (string->uri url-str)
    (leave (_ "invalid url: ~a~%") url-str))
  url-str)

(define (parse-build-system sys-str)
  (unless sys-str
    (leave (_ "\
init: missing --build-system; try --build-system=help for options~%")))
  (let ((sys (string->symbol (string-downcase sys-str))))
    (when (eq? sys 'help)
      (format #t "guix potluck: Available build systems:~%")
      (for-each
       (lambda (name)
         (let ((sys (build-system-by-name name)))
           (format #t "  ~a ~25t~a~%" name (build-system-description sys))))
       (all-potluck-build-system-names))
      (format #t "
Additionally, --autotools is like --build-system=gnu, but also indicating
that the package needs autoreconf before running ./configure.~%")
      (exit 0))
    (unless (build-system-by-name sys)
      (leave (_ "invalid build system: ~a; try --build-system=help~%") sys))
    sys))

(define (parse-license license-str)
  (unless license-str
    (leave (_ "init: missing --license; try --license=help for options~%")))
  (let ((license (string->symbol (string-downcase license-str))))
    (when (eq? license 'help)
      (format #t "guix potluck: Available licenses:~%")
      (for-each
       (lambda (name)
         (let ((license (license-by-name name)))
           (format #t "  ~a ~25t~a~%" name (license-uri license))))
       (all-potluck-license-names))
      (format #t "
If your package's license is not in this list, add it to Guix first.~%")
      (exit 0))
    (unless (license-by-name license)
      (leave (_ "invalid license: ~a; try --license=help~%") license))
    license))


;;;
;;; Entry point.
;;;

(define (guix-potluck . args)
  (define (parse-sub-command arg result)
    (if (assoc-ref result 'action)
        (alist-cons 'argument arg result)
        (alist-cons 'action (string->symbol arg) result)))

  (define (match-pair car)
    ;; Return a procedure that matches a pair with CAR.
    (match-lambda
      ((head . tail)
       (and (eq? car head) tail))
      (_ #f)))

  (with-error-handling
    (let* ((opts     (parse-command-line args %options
                                         (list %default-options)
                                         #:argument-handler
                                         parse-sub-command))
           (action   (assoc-ref opts 'action))
           (args     (reverse (filter-map (match-pair 'argument) opts))))
      (define (see-help)
        (format (current-error-port)
                (_ "Try 'guix potluck --help' for more information.~%")))
      (define (wrong-number-of-args usage)
        (format (current-error-port)
                (_ "guix potluck ~a: wrong number of arguments~%")
                action)
        (display usage (current-error-port))
        (newline (current-error-port))
        (see-help)
        (exit 1))
      (match action
        (#f
         (format (current-error-port)
                 (_ "guix potluck: missing command name~%"))
         (see-help)
         (exit 1))
        ('init
         (match args
           ((remote-git-url)
            (init-potluck (parse-url remote-git-url)
                          #:build-system (parse-build-system
                                          (assoc-ref opts 'build-system))
                          #:autoreconf? (assoc-ref opts 'autoreconf?)
                          #:license (parse-license
                                     (assoc-ref opts 'license))))
           (args
            (wrong-number-of-args
             (_ "usage: guix potluck init [OPT...] REMOTE-GIT-URL")))))
        (action
         (leave (_ "~a: unknown action~%") action))))))
