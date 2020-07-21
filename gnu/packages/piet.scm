;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2020 Jesse Gibbons <jgibbons2357+guix@gmail.com>
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

(define-module (gnu packages piet)
  #:use-module (guix packages)
  #:use-module (guix  download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages groff)
  #:use-module (guix licenses))


(define-public npiet
  (package
    (name "npiet")
    (version "1.3e")
    (source (origin
              (method url-fetch)
              (uri
               (string-append
                "https://www.bertnase.de/npiet/npiet-"
                version ".tar.gz"))
              (sha256
               (base32
                "1i9ihbjmravid3h7wvns712axdl5xn398hk12pvzl79fs5kcf6g8"))))
    (build-system gnu-build-system)
    (inputs
     `(("gd" ,gd)))
    (native-inputs `(("groff" ,groff)))
    (synopsis "Piet interpreter")
    (description
     "Npiet is an interpreter for the piet programming language.  Instead of
text, piet programs are pictures.  Commands are determined based on changes in
color.

This package includes:
@enumerate
@item npiet, a piet interpreter with debugging capabilities
@item npiet-foogol, a program that builds a piet program from foogol, an
algol-like language
@item npietedit, an editor for the piet programming language
@end enumerate")
    (home-page "https://www.bertnase.de/npiet/")
    (license gpl2+)))

