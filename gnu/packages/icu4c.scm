;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2015, 2016 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2016, 2017 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2017 Clément Lassieur <clement@lassieur.org>
;;; Copyright © 2017 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2019, 2020 Marius Bakke <mbakke@fastmail.com>
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

(define-module (gnu packages icu4c)
  #:use-module (gnu packages)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system gnu))

;; These patches are taken from ICUs 'maint-64' branch and will be included in
;; 64.3.  The latter patch is needed because many packages use "invalid"
;; locales which misbehave with ICU 64.2.  See discussion at
;; <https://lists.gnu.org/archive/html/guix-devel/2019-07/msg00343.html>.
(define %icu4c-patches
  (list (origin
          (method url-fetch)
          (uri (string-append "https://github.com/unicode-org/icu/commit/"
                              "7788f04eb9be0d7ecade6af46cf7b9825447763d.patch"))
          (file-name "icu4c-datetime-regression.patch")
          (sha256
           (base32
            "0gs2sbdfpzwwdjqcqr0c16fw3g7wy3gb1gbgvzs9k1ciw0bhpv4w")))
        (origin
          (method url-fetch)
          (uri (string-append "https://github.com/unicode-org/icu/commit/"
                              "cfb20862909ff105d4f2c43923c97561bc5a5815.patch"))
          (file-name "icu4c-locale-mapping.patch")
          (sha256
           (base32
            "0s5psb60aisj6icziblvlp9dqcz56n3887i8ib0yidbjnnrw5b97")))))

(define-public icu4c
  (package
   (name "icu4c")
   (replacement icu4c/fixed)
   (version "64.2")
   (source (origin
            (method url-fetch)
            (uri (string-append
                  "http://download.icu-project.org/files/icu4c/"
                  version
                  "/icu4c-"
                  (string-map (lambda (x) (if (char=? x #\.) #\_ x)) version)
                  "-src.tgz"))
            (patches %icu4c-patches)
            (patch-flags '("-p2"))
            (sha256
             (base32 "0v0xsf14xwlj125y9fd8lrhsaych4d8liv8gr746zng6g225szb2"))))
   (build-system gnu-build-system)
   (native-inputs
    `(("python" ,python-minimal)))
   (inputs
    `(("perl" ,perl)))
   (arguments
    `(#:configure-flags
      '("--enable-rpath")
      #:phases
      (modify-phases %standard-phases
        (add-after 'unpack 'chdir-to-source
          (lambda _ (chdir "source") #t))
        (add-after 'chdir-to-source 'update-LDFLAGS
          (lambda _
            ;; Do not create a "data-only" libicudata.so because it causes
            ;; problems on some architectures (notably armhf and MIPS).
            (substitute* "config/mh-linux"
              (("LDFLAGSICUDT=-nodefaultlibs -nostdlib")
               "LDFLAGSICUDT="))
            #t))
        (add-after 'install 'avoid-coreutils-reference
          ;; Don't keep a reference to the build tools.
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
              (substitute* (find-files (string-append out "/lib/icu")
                                       "\\.inc$")
                (("INSTALL_CMD=.*/bin/install") "INSTALL_CMD=install"))
              #t))))))
   (synopsis "International Components for Unicode")
   (description
    "ICU is a set of C/C++ and Java libraries providing Unicode and
globalisation support for software applications.  This package contains the
C/C++ part.")
   (license x11)
   (home-page "http://site.icu-project.org/")))

(define icu4c/fixed
  (package
    (inherit icu4c)
    (source (origin
              (inherit (package-source icu4c))
              (patch-flags '("-p2"))
              (patches (append
                         (origin-patches (package-source icu4c))
                         (search-patches
                           "icu4c-CVE-2020-10531.patch")))))))

(define-public icu4c-66.1
  (package
    (inherit icu4c)
    (version "66.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/unicode-org/icu/releases/download/release-"
                    (string-map (lambda (x) (if (char=? x #\.) #\- x)) version)
                    "/icu4c-"
                    (string-map (lambda (x) (if (char=? x #\.) #\_ x)) version)
                    "-src.tgz"))
              (patch-flags '("-p2"))
              (patches (search-patches "icu4c-CVE-2020-10531.patch"))
              (sha256
               (base32
                "0bharwzc9nzkbrcf405z2nb3h7q0711z450arz0mjmdrk8hg58sj"))))))

(define-public java-icu4j
  (package
    (name "java-icu4j")
    (version "59.1")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://download.icu-project.org/files/icu4j/"
                                  version "/icu4j-"
                                  (string-map (lambda (x)
                                                (if (char=? x #\.) #\_ x))
                                              version)
                                  "-src.jar"))
              (sha256
               (base32
                "0bgxsvgi0qcwj60pvcxrf7a3fbk7aksyxnfwpbzavyfrfzixqh0c"))))
    (build-system ant-build-system)
    (arguments
     `(#:tests? #f                      ; no tests included
       #:jar-name "icu4j.jar"))
    (home-page "http://site.icu-project.org/")
    (synopsis "International Components for Unicode")
    (description
     "ICU is a set of C/C++ and Java libraries providing Unicode and
globalisation support for software applications.  This package contains the
Java part.")
    (license x11)))
