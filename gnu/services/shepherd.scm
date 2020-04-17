;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014, 2015, 2016, 2018, 2019, 2020 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2018 Carlo Zancanaro <carlo@zancanaro.id.au>
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

(define-module (gnu services shepherd)
  #:use-module (guix ui)
  #:use-module (guix sets)
  #:use-module (guix gexp)
  #:use-module (guix store)
  #:use-module (guix records)
  #:use-module (guix derivations)                 ;imported-modules, etc.
  #:use-module (gnu services)
  #:use-module (gnu services herd)
  #:use-module (gnu packages admin)
  #:use-module (ice-9 match)
  #:use-module (ice-9 vlist)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (srfi srfi-34)
  #:use-module (srfi srfi-35)
  #:export (shepherd-root-service-type
            %shepherd-root-service
            shepherd-service-type

            shepherd-service
            shepherd-service?
            shepherd-service-documentation
            shepherd-service-provision
            shepherd-service-canonical-name
            shepherd-service-requirement
            shepherd-service-one-shot?
            shepherd-service-respawn?
            shepherd-service-start
            shepherd-service-stop
            shepherd-service-auto-start?
            shepherd-service-modules

            shepherd-action
            shepherd-action?
            shepherd-action-name
            shepherd-action-documentation
            shepherd-action-procedure

            %default-modules

            shepherd-service-file

            shepherd-service-lookup-procedure
            shepherd-service-back-edges
            shepherd-service-upgrade))

;;; Commentary:
;;;
;;; Instantiating system services as a shepherd configuration file.
;;;
;;; Code:


(define (shepherd-boot-gexp services)
  #~(begin
      ;; Keep track of the booted system.
      (false-if-exception (delete-file "/run/booted-system"))
      (symlink (readlink "/run/current-system")
               "/run/booted-system")

      ;; Close any remaining open file descriptors to be on the safe
      ;; side.  This must be the very last thing we do, because
      ;; Guile has internal FDs such as 'sleep_pipe' that need to be
      ;; alive.
      (let loop ((fd 3))
        (when (< fd 1024)
          (false-if-exception (close-fdes fd))
          (loop (+ 1 fd))))

      ;; Start shepherd.
      (execl #$(file-append shepherd "/bin/shepherd")
             "shepherd" "--config"
             #$(shepherd-configuration-file services))))

(define shepherd-root-service-type
  (service-type
   (name 'shepherd-root)
   ;; Extending the root shepherd service (aka. PID 1) happens by
   ;; concatenating the list of services provided by the extensions.
   (compose concatenate)
   (extend append)
   (extensions (list (service-extension boot-service-type
                                        shepherd-boot-gexp)
                     (service-extension profile-service-type
                                        (const (list shepherd)))))))

(define %shepherd-root-service
  ;; The root shepherd service, aka. PID 1.  Its parameter is a list of
  ;; <shepherd-service> objects.
  (service shepherd-root-service-type '()))

(define-syntax shepherd-service-type
  (syntax-rules ()
    "Return a <service-type> denoting a simple shepherd service--i.e., the type
for a service that extends SHEPHERD-ROOT-SERVICE-TYPE and nothing else.  When
DEFAULT is given, use it as the service's default value."
    ((_ service-name proc default)
     (service-type
      (name service-name)
      (extensions
       (list (service-extension shepherd-root-service-type
                                (compose list proc))))
      (default-value default)))
    ((_ service-name proc)
     (service-type
      (name service-name)
      (extensions
       (list (service-extension shepherd-root-service-type
                                (compose list proc))))))))

(define %default-imported-modules
  ;; Default set of modules imported for a service's consumption.
  '((guix build utils)
    (guix build syscalls)))

(define %default-modules
  ;; Default set of modules visible in a service's file.
  `((shepherd service)
    (oop goops)
    (guix build utils)
    (guix build syscalls)))

(define-record-type* <shepherd-service>
  shepherd-service make-shepherd-service
  shepherd-service?
  (documentation shepherd-service-documentation        ;string
                 (default "[No documentation.]"))
  (provision     shepherd-service-provision)           ;list of symbols
  (requirement   shepherd-service-requirement          ;list of symbols
                 (default '()))
  (one-shot?     shepherd-service-one-shot?            ;Boolean
                 (default #f))
  (respawn?      shepherd-service-respawn?             ;Boolean
                 (default #t))
  (start         shepherd-service-start)               ;g-expression (procedure)
  (stop          shepherd-service-stop                 ;g-expression (procedure)
                 (default #~(const #f)))
  (actions       shepherd-service-actions              ;list of <shepherd-action>
                 (default '()))
  (auto-start?   shepherd-service-auto-start?          ;Boolean
                 (default #t))
  (modules       shepherd-service-modules              ;list of module names
                 (default %default-modules)))

(define-record-type* <shepherd-action>
  shepherd-action make-shepherd-action
  shepherd-action?
  (name          shepherd-action-name)            ;symbol
  (procedure     shepherd-action-procedure)       ;gexp
  (documentation shepherd-action-documentation))  ;string

(define (shepherd-service-canonical-name service)
  "Return the 'canonical name' of SERVICE."
  (first (shepherd-service-provision service)))

(define (assert-valid-graph services)
  "Raise an error if SERVICES does not define a valid shepherd service graph,
for instance if a service requires a nonexistent service, or if more than one
service uses a given name.

These are constraints that shepherd's 'register-service' verifies but we'd
better verify them here statically than wait until PID 1 halts with an
assertion failure."
  (define provisions
    ;; The set of provisions (symbols).  Bail out if a symbol is given more
    ;; than once.
    (fold (lambda (service set)
            (define (assert-unique symbol)
              (when (set-contains? set symbol)
                (raise (condition
                        (&message
                         (message
                          (format #f (G_ "service '~a' provided more than once")
                                  symbol)))))))

            (for-each assert-unique (shepherd-service-provision service))
            (fold set-insert set (shepherd-service-provision service)))
          (setq 'shepherd)
          services))

  (define (assert-satisfied-requirements service)
    ;; Bail out if the requirements of SERVICE aren't satisfied.
    (for-each (lambda (requirement)
                (unless (set-contains? provisions requirement)
                  (raise (condition
                          (&message
                           (message
                            (format #f (G_ "service '~a' requires '~a', \
which is not provided by any service")
                                    (match (shepherd-service-provision service)
                                      ((head . _) head)
                                      (_          service))
                                    requirement)))))))
              (shepherd-service-requirement service)))

  (for-each assert-satisfied-requirements services))

(define (shepherd-service-file-name service)
  "Return the file name where the initialization code for SERVICE is to be
stored."
  (let ((provisions (string-join (map symbol->string
                                      (shepherd-service-provision service)))))
    (string-append "shepherd-"
                   (string-map (match-lambda
                                 (#\/ #\-)
                                 (#\  #\-)
                                 (chr chr))
                               provisions)
                   ".scm")))

(define (shepherd-service-file service)
  "Return a file defining SERVICE."
  (scheme-file (shepherd-service-file-name service)
               (with-imported-modules %default-imported-modules
                 #~(begin
                     (use-modules #$@(shepherd-service-modules service))

                     (make <service>
                       #:docstring '#$(shepherd-service-documentation service)
                       #:provides '#$(shepherd-service-provision service)
                       #:requires '#$(shepherd-service-requirement service)

                       ;; The 'one-shot?' slot is new in Shepherd 0.6.0.
                       ;; Older versions ignore it.
                       #:one-shot? '#$(shepherd-service-one-shot? service)

                       #:respawn? '#$(shepherd-service-respawn? service)
                       #:start #$(shepherd-service-start service)
                       #:stop #$(shepherd-service-stop service)
                       #:actions
                       (make-actions
                        #$@(map (match-lambda
                                  (($ <shepherd-action> name proc doc)
                                   #~(#$name #$doc #$proc)))
                                (shepherd-service-actions service))))))))

(define (scm->go file)
  "Compile FILE, which contains code to be loaded by shepherd's config file,
and return the resulting '.go' file."
  (with-extensions (list shepherd)
    (computed-file (string-append (basename (scheme-file-name file) ".scm")
                                  ".go")
                   #~(begin
                       (use-modules (system base compile))

                       ;; Do the same as the Shepherd's 'load-in-user-module'.
                       (let ((env (make-fresh-user-module)))
                         (module-use! env (resolve-interface '(oop goops)))
                         (module-use! env (resolve-interface '(shepherd service)))
                         (compile-file #$file #:output-file #$output
                                       #:env env)))

                   ;; It's faster to build locally than to download.
                   #:options '(#:local-build? #t
                               #:substitutable? #f))))

(define (shepherd-configuration-file services)
  "Return the shepherd configuration file for SERVICES."
  (assert-valid-graph services)

  (let ((files (map shepherd-service-file services)))
    (define config
      #~(begin
          (use-modules (srfi srfi-34)
                       (system repl error-handling))

          ;; Specify the default environment visible to all the services.
          ;; Without this statement, all the environment variables of PID 1
          ;; are inherited by child services.
          (default-environment-variables
            '("PATH=/run/current-system/profile/bin"))

          ;; Booting off a DVD, especially on a slow machine, can make
          ;; everything slow.  Thus, increase the timeout compared to the
          ;; default 5s in the Shepherd 0.7.0.  See
          ;; <https://bugs.gnu.org/40572>.
          ;; XXX: Use something better when the next Shepherd is out.
          (set! (@@ (shepherd service) %pid-file-timeout) 30)

          ;; Arrange to spawn a REPL if something goes wrong.  This is better
          ;; than a kernel panic.
          (call-with-error-handling
            (lambda ()
              (apply register-services
                     (map load-compiled '#$(map scm->go files)))))

          (format #t "starting services...~%")
          (for-each (lambda (service)
                      ;; In the Shepherd 0.3 the 'start' method can raise
                      ;; '&action-runtime-error' if it fails, so protect
                      ;; against it.  (XXX: 'action-runtime-error?' is not
                      ;; exported is 0.3, hence 'service-error?'.)
                      (guard (c ((service-error? c)
                                 (format (current-error-port)
                                         "failed to start service '~a'~%"
                                         service)))
                        (start service)))
                    '#$(append-map shepherd-service-provision
                                   (filter shepherd-service-auto-start?
                                           services)))

          ;; Hang up stdin.  At this point, we assume that 'start' methods
          ;; that required user interaction on the console (e.g.,
          ;; 'cryptsetup open' invocations, post-fsck emergency REPL) have
          ;; completed.  User interaction becomes impossible after this
          ;; call; this avoids situations where services wrongfully lead
          ;; PID 1 to read from stdin (the console), which users may not
          ;; have access to (see <https://bugs.gnu.org/23697>).
          (redirect-port (open-input-file "/dev/null")
                         (current-input-port))))

    (scheme-file "shepherd.conf" config)))

(define* (shepherd-service-lookup-procedure services
                                            #:optional
                                            (provision
                                             shepherd-service-provision))
  "Return a procedure that, when passed a symbol, return the item among
SERVICES that provides this symbol.  PROVISION must be a one-argument
procedure that takes a service and returns the list of symbols it provides."
  (let ((services (fold (lambda (service result)
                          (fold (cut vhash-consq <> service <>)
                                result
                                (provision service)))
                        vlist-null
                        services)))
    (lambda (name)
      (match (vhash-assq name services)
        ((_ . service) service)
        (#f            #f)))))

(define* (shepherd-service-back-edges services
                                      #:key
                                      (provision shepherd-service-provision)
                                      (requirement shepherd-service-requirement))
  "Return a procedure that, when given a <shepherd-service> from SERVICES,
returns the list of <shepherd-service> that depend on it.

Use PROVISION and REQUIREMENT as one-argument procedures that return the
symbols provided/required by a service."
  (define provision->service
    (shepherd-service-lookup-procedure services provision))

  (define edges
    (fold (lambda (service edges)
            (fold (lambda (requirement edges)
                    (vhash-consq (provision->service requirement) service
                                 edges))
                  edges
                  (requirement service)))
          vlist-null
          services))

  (lambda (service)
    (vhash-foldq* cons '() service edges)))

(define (shepherd-service-upgrade live target)
  "Return two values: the subset of LIVE (a list of <live-service>) that needs
to be unloaded, and the subset of TARGET (a list of <shepherd-service>) that
need to be restarted to complete their upgrade."
  (define (essential? service)
    (memq (first (live-service-provision service))
          '(root shepherd)))

  (define lookup-target
    (shepherd-service-lookup-procedure target
                                       shepherd-service-provision))

  (define lookup-live
    (shepherd-service-lookup-procedure live
                                       live-service-provision))

  (define (running? service)
    (and=> (lookup-live (shepherd-service-canonical-name service))
           live-service-running))

  (define live-service-dependents
    (shepherd-service-back-edges live
                                 #:provision live-service-provision
                                 #:requirement live-service-requirement))

  (define (obsolete? service)
    (match (lookup-target (first (live-service-provision service)))
      (#f (every obsolete? (live-service-dependents service)))
      (_  #f)))

  (define to-restart
    ;; Restart services that are currently running.
    (filter running? target))

  (define to-unload
    ;; Unload services that are no longer required.
    (remove essential? (filter obsolete? live)))

  (values to-unload to-restart))

;;; shepherd.scm ends here
