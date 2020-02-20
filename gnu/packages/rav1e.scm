(define-module (gnu packages rav1e)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages assembly) 
  #:use-module (gnu packages crates-io) 
  #:use-module (gnu packages rust-apps))

(define-public rust-output-vt100-0.1
  (package
    (name "rust-output-vt100")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "output_vt100" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ygqplpxz4gg3i8f3rkan2q69pqll7gv65l2mmd8r9dphnvwbkak"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
      "https://github.com/Phundrak/output-vt100-rs")
    (synopsis
      "Utility to activate escape codes in Windows' CMD and PowerShell")
    (description
      "Utility to activate escape codes in Windows' CMD and PowerShell")
    (license license:expat)))

(define-public rust-ctor-0.1
  (package
    (name "rust-ctor")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ctor" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1p7fd2zp3lkb098sn740jlf3np8qg5ivycsc037b4jhqsixf736d"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0))))
    (home-page
      "https://github.com/mmastrac/rust-ctor")
    (synopsis
      "__attribute__((constructor)) for Rust")
    (description
      "__attribute__((constructor)) for Rust")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pretty-assertions-0.6
  (package
    (name "rust-pretty-assertions")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pretty_assertions" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "09yl14gnmpygiqrdlsa64lcl4w6ydjl9m8jri6kgam0v9rjf309z"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-ctor" ,rust-ctor-0.1)
         ("rust-output-vt100" ,rust-output-vt100-0.1)
         ("rust-ansi-term" ,rust-ansi-term-0.11)
         ("rust-difference" ,rust-difference-2.0))))
    (home-page
      "https://github.com/colin-kiegel/rust-pretty-assertions")
    (synopsis
      "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.")
    (description
      "Overwrite `assert_eq!` and `assert_ne!` with drop-in replacements, adding colorful diffs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-oorandom-11.1
  (package
    (name "rust-oorandom")
    (version "11.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "oorandom" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "01clxfnz1zwg4maynvbgj09wlkj5m3c8kjqfrp3sqp59qb4wgkpb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://hg.sr.ht/~icefox/oorandom")
    (synopsis "A tiny, robust PRNG implementation.")
    (description
      "This package provides a tiny, robust PRNG implementation.")
    (license license:expat)))

(define-public rust-utf8-ranges-1.0
  (package
    (name "rust-utf8-ranges")
    (version "1.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "utf8-ranges" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fpc32znar5v02nwsw7icl41jzzzzhy0si6ngqjylzrbxxpi3bml"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/BurntSushi/utf8-ranges")
    (synopsis
      "DEPRECATED. Use regex-syntax::utf8 submodule instead.")
    (description
      "DEPRECATED.  Use regex-syntax::utf8 submodule instead.")
    (license (list license:unlicense license:expat))))

(define-public rust-regex-automata-0.1
  (package
    (name "rust-regex-automata")
    (version "0.1.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "regex-automata" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1y89vkwd9z7797lsdsizvhw4lw7i1mhfx97a8315bhkh2wm3rdwj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-regex-syntax" ,rust-regex-syntax-0.6)
         ("rust-utf8-ranges" ,rust-utf8-ranges-1.0)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/BurntSushi/regex-automata")
    (synopsis
      "Automata construction and matching using regular expressions.")
    (description
      "Automata construction and matching using regular expressions.")
    (license (list license:unlicense license:expat))))

(define-public rust-bstr-0.2
  (package
    (name "rust-bstr")
    (version "0.2.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bstr" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0j1cki9nmplv99gdwrdlj8z4kf8ncid9b99qpn7xnnha392f2ajh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-regex-automata" ,rust-regex-automata-0.1)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-memchr" ,rust-memchr-2.3))))
    (home-page "https://github.com/BurntSushi/bstr")
    (synopsis
      "A string type that is not required to be valid UTF-8.")
    (description
      "This package provides a string type that is not required to be valid UTF-8.")
    (license (list license:expat license:asl2.0))))

(define-public rust-csv-core-0.1
  (package
    (name "rust-csv-core")
    (version "0.1.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "csv-core" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "145wcc3560v1kmysqqspvddppiysr2rifqzy4nnlh3r6kxanc91b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-memchr" ,rust-memchr-2.3))))
    (home-page
      "https://github.com/BurntSushi/rust-csv")
    (synopsis
      "Bare bones CSV parsing with no_std support.")
    (description
      "Bare bones CSV parsing with no_std support.")
    (license (list license:unlicense license:expat))))

(define-public rust-csv-1.1
  (package
    (name "rust-csv")
    (version "1.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "csv" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0yd2z55m2pg4al4yng4nl2y7c9dw2v7yhg5ynihxyrmmd9zzxbq0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-csv-core" ,rust-csv-core-0.1)
         ("rust-bstr" ,rust-bstr-0.2)
         ("rust-itoa" ,rust-itoa-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-ryu" ,rust-ryu-1.0))))
    (home-page
      "https://github.com/BurntSushi/rust-csv")
    (synopsis
      "Fast CSV parsing with support for serde.")
    (description
      "Fast CSV parsing with support for serde.")
    (license (list license:unlicense license:expat))))

(define-public rust-tinytemplate-1.0
  (package
    (name "rust-tinytemplate")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tinytemplate" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "06ipxjwl1w6synvql8b50qxbqv0w04agvmmfqcdynr9ygmkcd8sp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
      "https://github.com/bheisler/TinyTemplate")
    (synopsis "Simple, lightweight template engine")
    (description
      "Simple, lightweight template engine")
    (license (list license:asl2.0 license:expat))))

(define-public rust-criterion-plot-0.4
  (package
    (name "rust-criterion-plot")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "criterion-plot" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0id5sfww0hjxlzvkzacdlgbls3lxza8iysqljr7j7s2qxbh1a7m0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cast" ,rust-cast-0.2)
         ("rust-itertools" ,rust-itertools-0.8))))
    (home-page
      "https://github.com/bheisler/criterion.rs")
    (synopsis "Criterion's plotting library")
    (description "Criterion's plotting library")
    (license (list license:expat license:asl2.0))))

(define-public rust-cast-0.2
  (package
    (name "rust-cast")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cast" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1c5z7zryj0zwnhdgs6rw5dfvnlwc1vm19jzrlgx5055alnwk952b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustc-version" ,rust-rustc-version-0.2))))
    (home-page "https://github.com/japaric/cast.rs")
    (synopsis
      "Ergonomic, checked cast functions for primitive types")
    (description
      "Ergonomic, checked cast functions for primitive types")
    (license (list license:expat license:asl2.0))))

(define-public rust-x11-2.18
  (package
    (name "rust-x11")
    (version "2.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "x11" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0wz7l6dlbraa9zalh9i45v9wibvkir9m2m1sg0jnzcbcaj9d1v3p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
      "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "X11 library bindings for Rust")
    (license license:expat)))

(define-public rust-cairo-sys-rs-0.9
  (package
    (name "rust-cairo-sys-rs")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cairo-sys-rs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0qsdy6s57yvscg2rfm7wdqrlhzbn1aq9lhk3dy1vw5f7r81blrgz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-glib-sys" ,rust-glib-sys-0.9)
         ("rust-x11" ,rust-x11-2.18))))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libcairo")
    (description "FFI bindings to libcairo")
    (license license:expat)))

(define-public rust-gobject-sys-0.9
  (package
    (name "rust-gobject-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gobject-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1nakflbp3gjaas4fw7sn3p1p32khyfpcq1h06z7yqd10yq2ail9i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-glib-sys" ,rust-glib-sys-0.9))))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libgobject-2.0")
    (description "FFI bindings to libgobject-2.0")
    (license license:expat)))

(define-public rust-glib-sys-0.9
  (package
    (name "rust-glib-sys")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glib-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qhnwfqqcp63mx4q9744rfkq78g6ky2j8ppsxxgw0ipl08w6z1cm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://gtk-rs.org/")
    (synopsis "FFI bindings to libglib-2.0")
    (description "FFI bindings to libglib-2.0")
    (license license:expat)))

(define-public rust-memchr-2.3
  (package
    (name "rust-memchr")
    (version "2.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "memchr" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0y1rjc2afcxdf8lg4h31ivlfil242s2ivilpfiwkdx51h7imsi2k"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/BurntSushi/rust-memchr")
    (synopsis "Safe interface to memchr.")
    (description "Safe interface to memchr.")
    (license (list license:unlicense license:expat))))

(define-public rust-futures-select-macro-preview-0.3
  (package
    (name "rust-futures-select-macro-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri
               "futures-select-macro-preview"
               version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xsq55cf2rnf7k6r04q8wynmxiy9svm3pi840vjva47bc0sy8anz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "The `select!` macro for waiting on multiple different `Future`s at once and handling the first one to complete.
")
    (description
      "The `select!` macro for waiting on multiple different `Future`s at once and handling the first one to complete.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-join-macro-preview-0.3
  (package
    (name "rust-futures-join-macro-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-join-macro-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1smwaja466yjh5adlhgggfk9k942sy4702n46scxkrwcnkk61qjr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "Definition of the `join!` macro and the `try_join!` macro.
")
    (description
      "Definition of the `join!` macro and the `try_join!` macro.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-io-preview-0.3
  (package
    (name "rust-futures-io-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-io-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1npb04xbn2gw5rjllz88cb88fql44xxfkgcidjjj26fva3j4m4gl"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "The `AsyncRead` and `AsyncWrite` traits for the futures-rs library.
")
    (description
      "The `AsyncRead` and `AsyncWrite` traits for the futures-rs library.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-util-preview-0.3
  (package
    (name "rust-futures-util-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-util-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "138f8wy0vqy2gsgk28kldbqnrdcgwfv9f9xx6rwzkr8p7iinisaw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pin-utils" ,rust-pin-utils-0.1)
         ("rust-tokio-io" ,rust-tokio-io-0.1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-proc-macro-nested"
          ,rust-proc-macro-nested-0.1)
         ("rust-futures-core-preview"
          ,rust-futures-core-preview-0.3)
         ("rust-futures-channel-preview"
          ,rust-futures-channel-preview-0.3)
         ("rust-futures-io-preview"
          ,rust-futures-io-preview-0.3)
         ("rust-futures-join-macro-preview"
          ,rust-futures-join-macro-preview-0.3)
         ("rust-futures-select-macro-preview"
          ,rust-futures-select-macro-preview-0.3)
         ("rust-futures-sink-preview"
          ,rust-futures-sink-preview-0.3)
         ("rust-slab" ,rust-slab-0.4)
         ("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-memchr" ,rust-memchr-2.3))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "Common utilities and extension traits for the futures-rs library.
")
    (description
      "Common utilities and extension traits for the futures-rs library.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-executor-preview-0.3
  (package
    (name "rust-futures-executor-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-executor-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "161yv7wwha60mdzj1id47kh8ylnhcnv7blgwidg8xs4zpn46w8vm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures-core-preview"
          ,rust-futures-core-preview-0.3)
         ("rust-futures-util-preview"
          ,rust-futures-util-preview-0.3)
         ("rust-num-cpus" ,rust-num-cpus-1.12))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "Executors for asynchronous tasks based on the futures-rs library.
")
    (description
      "Executors for asynchronous tasks based on the futures-rs library.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-sink-preview-0.3
  (package
    (name "rust-futures-sink-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-sink-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1v7y5qvgvl0d6hd9s4k7bd5qrj2gdlrs5yfl22v5pxv9dgpliwc6"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "The asynchronous `Sink` trait for the futures-rs library.
")
    (description
      "The asynchronous `Sink` trait for the futures-rs library.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-core-preview-0.3
  (package
    (name "rust-futures-core-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-core-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "02n66jkjhpy210dv24pz0j30lvyin5kzlrb50p1j7x8yzdin4nxk"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "The core traits and types in for the `futures` library.
")
    (description
      "The core traits and types in for the `futures` library.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-channel-preview-0.3
  (package
    (name "rust-futures-channel-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-channel-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0fi6bi4lpyxjigy11y5sjg6wlc8nc71vbpmxz31c3aagjvgz9rfm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures-core-preview"
          ,rust-futures-core-preview-0.3)
         ("rust-futures-sink-preview"
          ,rust-futures-sink-preview-0.3))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "Channels for asynchronous communication using futures-rs.
")
    (description
      "Channels for asynchronous communication using futures-rs.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-futures-preview-0.3
  (package
    (name "rust-futures-preview")
    (version "0.3.0-alpha.19")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "futures-preview" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0vnp63aicm9vgapn4hm45ag9lrsf9f3bma3mzz3abbb708mcw79v"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures-channel-preview"
          ,rust-futures-channel-preview-0.3)
         ("rust-futures-core-preview"
          ,rust-futures-core-preview-0.3)
         ("rust-futures-executor-preview"
          ,rust-futures-executor-preview-0.3)
         ("rust-futures-io-preview"
          ,rust-futures-io-preview-0.3)
         ("rust-futures-sink-preview"
          ,rust-futures-sink-preview-0.3)
         ("rust-futures-util-preview"
          ,rust-futures-util-preview-0.3))))
    (home-page
      "https://rust-lang-nursery.github.io/futures-rs")
    (synopsis
      "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.
")
    (description
      "An implementation of futures and streams featuring zero allocations,
composability, and iterator-like interfaces.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-glib-0.8
  (package
    (name "rust-glib")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glib" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ysy87zrwyzhfpf3d8rkyyr3amwj85wky05fsl7kx95s84l269xy"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-futures-preview"
          ,rust-futures-preview-0.3)
         ("rust-glib-sys" ,rust-glib-sys-0.9)
         ("rust-gobject-sys" ,rust-gobject-sys-0.9)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page "http://gtk-rs.org/")
    (synopsis "Rust bindings for the GLib library")
    (description
      "Rust bindings for the GLib library")
    (license license:expat)))

(define-public rust-rustdoc-stripper-0.1
  (package
    (name "rust-rustdoc-stripper")
    (version "0.1.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustdoc-stripper" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "13rf65a0xk1zyb92jd8p12x529rsbfchwk9zvjr0snr9savpxw19"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/GuillaumeGomez/rustdoc-stripper")
    (synopsis
      "A tool to manipulate rustdoc comments")
    (description
      "This package provides a tool to manipulate rustdoc comments")
    (license license:asl2.0)))

(define-public rust-gtk-rs-lgpl-docs-0.1
  (package
    (name "rust-gtk-rs-lgpl-docs")
    (version "0.1.15")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gtk-rs-lgpl-docs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "06b1j64zg0xmhwfkyhzh3y0apclg6qihn3f7s1bd7kgjmkia4jlr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustdoc-stripper"
          ,rust-rustdoc-stripper-0.1))))
    (home-page "http://gtk-rs.org/")
    (synopsis "LGPL-licensed docs for Gtk-rs crates")
    (description
      "LGPL-licensed docs for Gtk-rs crates")
    (license license:lgpl2.0)))

(define-public rust-cairo-rs-0.7
  (package
    (name "rust-cairo-rs")
    (version "0.7.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cairo-rs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "171m98g41avp5mmshqir4ka21napp7ma5fx45wi9mw5hwdyv8pg0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gtk-rs-lgpl-docs"
          ,rust-gtk-rs-lgpl-docs-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-glib" ,rust-glib-0.8)
         ("rust-glib-sys" ,rust-glib-sys-0.9)
         ("rust-gobject-sys" ,rust-gobject-sys-0.9)
         ("rust-cairo-sys-rs" ,rust-cairo-sys-rs-0.9)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "http://gtk-rs.org/")
    (synopsis "Rust bindings for the Cairo library")
    (description
      "Rust bindings for the Cairo library")
    (license license:expat)))

(define-public rust-phf-codegen-0.8
  (package
    (name "rust-phf-codegen")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_codegen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05d8w7aqqjb6039pfm6404gk5dlwrrf97kiy1n21212vb1hyxzyb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-phf-generator" ,rust-phf-generator-0.8)
         ("rust-phf-shared" ,rust-phf-shared-0.8))))
    (home-page
      "https://github.com/sfackler/rust-phf")
    (synopsis "Codegen library for PHF types")
    (description "Codegen library for PHF types")
    (license license:expat)))

(define-public rust-phf-generator-0.8
  (package
    (name "rust-phf-generator")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_generator" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "09i5338d1kixq6a60fcayz6awgxjlxcfw9ic5f02abbgr067ydhp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-criterion" ,rust-criterion-0.3)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-phf-shared" ,rust-phf-shared-0.8))))
    (home-page
      "https://github.com/sfackler/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license license:expat)))

(define-public rust-phf-macros-0.8
  (package
    (name "rust-phf-macros")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_macros" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "170qm6yqn6b9mjlwb2xmm3iad9d5nzwgfawfwy7zr7s2zwcdwvvz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-phf-generator" ,rust-phf-generator-0.8)
         ("rust-phf-shared" ,rust-phf-shared-0.8)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/sfackler/rust-phf")
    (synopsis
      "Macros to generate types in the phf crate")
    (description
      "Macros to generate types in the phf crate")
    (license license:expat)))

(define-public rust-unicase-2.6
  (package
    (name "rust-unicase")
    (version "2.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unicase" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xmlbink4ycgxrkjspp0mf7pghcx4m7vxq7fpfm04ikr2zk7pwsh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-version-check" ,rust-version-check-0.9))))
    (home-page
      "https://github.com/seanmonstar/unicase")
    (synopsis
      "A case-insensitive wrapper around strings.")
    (description
      "This package provides a case-insensitive wrapper around strings.")
    (license (list license:expat license:asl2.0))))

(define-public rust-siphasher-0.3
  (package
    (name "rust-siphasher")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "siphasher" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "17cj2ynbv5zs7fa8ylrw7a6pb260q53ccj091mj9xa6ix0745nl3"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://docs.rs/siphasher")
    (synopsis
      "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust")
    (description
      "SipHash-2-4, SipHash-1-3 and 128-bit variants in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-phf-shared-0.8
  (package
    (name "rust-phf-shared")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf_shared" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xssnqrrcn0nr9ayqrnm8xm37ac4xvwcx8pax7jxss7yxawzh360"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-siphasher" ,rust-siphasher-0.3)
         ("rust-unicase" ,rust-unicase-2.6))))
    (home-page
      "https://github.com/sfackler/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description
      "Support code shared by PHF libraries")
    (license license:expat)))

(define-public rust-phf-0.8
  (package
    (name "rust-phf")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "phf" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "04pyv8bzqvw69rd5dynd5nb85py1hf7wa4ixyhrvdz1l5qin3yrx"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-phf-shared" ,rust-phf-shared-0.8)
         ("rust-phf-macros" ,rust-phf-macros-0.8))))
    (home-page
      "https://github.com/sfackler/rust-phf")
    (synopsis
      "Runtime support for perfect hash function data structures")
    (description
      "Runtime support for perfect hash function data structures")
    (license license:expat)))

(define-public rust-palette-derive-0.5
  (package
    (name "rust-palette-derive")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette_derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1x5icddb877923rpl27bg4cjsf1x0d3layxmgwa3mpb01rh5yjqb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis
      "Automatically implement traits from the palette crate.")
    (description
      "Automatically implement traits from the palette crate.")
    (license (list license:expat license:asl2.0))))

(define-public rust-palette-0.5
  (package
    (name "rust-palette")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "palette" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0nfc4ycdsx2qgf2wkcpxqxc0vmx7188jjjx3ppgs8qlf8qs06p50"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-approx" ,rust-approx-0.3)
         ("rust-palette-derive" ,rust-palette-derive-0.5)
         ("rust-phf" ,rust-phf-0.8)
         ("rust-phf-codegen" ,rust-phf-codegen-0.8)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/Ogeon/palette")
    (synopsis
      "Makes linear color calculations and conversion easy and accessible for anyone.")
    (description
      "Makes linear color calculations and conversion easy and accessible for anyone.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-text-13.3
  (package
    (name "rust-core-text")
    (version "13.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "core-text" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0v9lxn277p39cf81pb45r7k0lzf17pwgd5cpry1c04ajv556b16v"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-core-graphics" ,rust-core-graphics-0.17)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6))))
    (home-page
      "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to the Core Text framework.")
    (description
      "Bindings to the Core Text framework.")
    (license (list license:expat license:asl2.0))))

(define-public rust-base64-0.11
  (package
    (name "rust-base64")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "base64" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1iqmims6yvr6vwzyy54qd672zw29ipjj17p8klcr578c9ajpw6xl"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/marshallpierce/rust-base64")
    (synopsis
      "encodes and decodes base64 as bytes or utf8")
    (description
      "encodes and decodes base64 as bytes or utf8")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-argon2-0.7
  (package
    (name "rust-rust-argon2")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust-argon2" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05xh5wfxgzq3b6jys8r34f3hmqqfs8ylvf934n9z87wfv95szj1b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-constant-time-eq"
          ,rust-constant-time-eq-0.1)
         ("rust-base64" ,rust-base64-0.11)
         ("rust-blake2b-simd" ,rust-blake2b-simd-0.5)
         ("rust-crossbeam-utils"
          ,rust-crossbeam-utils-0.7))))
    (home-page
      "https://github.com/sru-systems/rust-argon2")
    (synopsis
      "Rust implementation of the Argon2 password hashing function.")
    (description
      "Rust implementation of the Argon2 password hashing function.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasi-0.9
  (package
    (name "rust-wasi")
    (version "0.9.0+wasi-snapshot-preview1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasi" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "06g5v3vrdapfzvfq662cij7v8a1flwr2my45nnncdv2galrdzkfc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-compiler-builtins"
          ,rust-compiler-builtins-0.1)
         ("rust-rustc-std-workspace-alloc"
          ,rust-rustc-std-workspace-alloc-1.0)
         ("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0))))
    (home-page
      "https://github.com/bytecodealliance/wasi")
    (synopsis
      "Experimental WASI API bindings for Rust")
    (description
      "Experimental WASI API bindings for Rust")
    (license
      (list ;unknown-license!
            license:asl2.0
            license:expat))))

(define-public rust-getrandom-0.1
  (package
    (name "rust-getrandom")
    (version "0.1.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "getrandom" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1sq30li71h19rhnhs1h6576ja68insajx8wvh1nn088r8pc8vg3s"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-compiler-builtins"
          ,rust-compiler-builtins-0.1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-stdweb" ,rust-stdweb-0.4)
         ("rust-wasi" ,rust-wasi-0.9)
         ("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0))))
    (home-page
      "https://github.com/rust-random/getrandom")
    (synopsis
      "A small cross-platform library for retrieving random data from system source")
    (description
      "This package provides a small cross-platform library for retrieving random data from system source")
    (license (list license:expat license:asl2.0))))

(define-public rust-redox-users-0.3
  (package
    (name "rust-redox-users")
    (version "0.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "redox_users" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0cbl5w16l3bqm22i4vszclf6hzpljxicghmllw7j13az4s9k1ch9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-getrandom" ,rust-getrandom-0.1)
         ("rust-redox-syscall" ,rust-redox-syscall-0.1)
         ("rust-rust-argon2" ,rust-rust-argon2-0.7))))
    (home-page
      "https://gitlab.redox-os.org/redox-os/users")
    (synopsis
      "A Rust library to access Redox users and groups functionality")
    (description
      "This package provides a Rust library to access Redox users and groups functionality")
    (license license:expat)))

(define-public rust-dirs-1.0
  (package
    (name "rust-dirs")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dirs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "009rrhzj9pxyncmm2vhlj70npg0cgggv2hjbbkiwdl9vccq8kmrz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-redox-users" ,rust-redox-users-0.3)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/soc/dirs-rs")
    (synopsis
      "A tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.")
    (description
      "This package provides a tiny low-level library that provides platform-specific standard locations of directories for config, cache and other data on Linux, Windows, macOS and Redox by leveraging the mechanisms defined by the XDG base/user directory specifications on Linux, the Known Folder API on Windows, and the Standard Directory guidelines on macOS.")
    (license (list license:expat license:asl2.0))))

(define-public rust-freetype-0.4
  (package
    (name "rust-freetype")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "freetype" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0a70x03n68997f08bi3n47q9wyi3pv5s9v4rjc79sihb84mnp4hi"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-servo-freetype-sys"
          ,rust-servo-freetype-sys-4.0))))
    (home-page
      "https://github.com/servo/rust-freetype")
    (synopsis "Bindings for Freetype used by Servo")
    (description
      "Bindings for Freetype used by Servo")
    (license (list license:asl2.0 license:expat))))

(define-public rust-servo-freetype-sys-4.0
  (package
    (name "rust-servo-freetype-sys")
    (version "4.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "servo-freetype-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1z0dvnakans4vn4vlpx4nxg984427lh8dskxxz9pglij1mnwnk1c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cmake" ,rust-cmake-0.1)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://www.freetype.org/")
    (synopsis
      "FreeType is a freely available software library to render fonts.")
    (description
      "FreeType is a freely available software library to render fonts.")
    (license (list license:freetype license:gpl2))))

(define-public rust-expat-sys-2.1
  (package
    (name "rust-expat-sys")
    (version "2.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "expat-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1yj5pqynds776ay8wg9mhi3hvna4fv7vf244yr1864r0i5r1k3v5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cmake" ,rust-cmake-0.1)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page "http://www.libexpat.org/")
    (synopsis "XML parser library written in C")
    (description "XML parser library written in C")
    (license license:expat)))

(define-public rust-servo-fontconfig-sys-4.0
  (package
    (name "rust-servo-fontconfig-sys")
    (version "4.0.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "servo-fontconfig-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0v0mbicy74wd6cjd5jyqnm4nvrrr5lmg053cn16kylhg8mkf3cv2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-expat-sys" ,rust-expat-sys-2.1)
         ("rust-servo-freetype-sys"
          ,rust-servo-freetype-sys-4.0))))
    (home-page "http://fontconfig.org")
    (synopsis
      "Font configuration and customization library")
    (description
      "Font configuration and customization library")
    (license license:expat)))

(define-public rust-servo-fontconfig-0.4
  (package
    (name "rust-servo-fontconfig")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "servo-fontconfig" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1nach6s4hdf86jz5hlm4p5r7vin91cs7gg89mr533id5fpbzi250"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-servo-fontconfig-sys"
          ,rust-servo-fontconfig-sys-4.0))))
    (home-page
      "https://github.com/servo/rust-fontconfig/")
    (synopsis "Rust bindings for fontconfig")
    (description "Rust bindings for fontconfig")
    (license (list license:expat license:asl2.0))))

(define-public rust-arrayvec-0.4
  (package
    (name "rust-arrayvec")
    (version "0.4.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arrayvec" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fdiv5m627gh6flp4mpmi1mh647imm9x423licsr11psz97d97yd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nodrop" ,rust-nodrop-0.1)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/bluss/arrayvec")
    (synopsis
      "A vector with fixed capacity, backed by an array (it can be stored on the stack too). Implements fixed capacity ArrayVec and ArrayString.")
    (description
      "This package provides a vector with fixed capacity, backed by an array (it can be stored on the stack too).  Implements fixed capacity ArrayVec and ArrayString.")
    (license (list license:expat license:asl2.0))))

(define-public rust-euclid-0.20
  (package
    (name "rust-euclid")
    (version "0.20.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "euclid" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0pa8kxblvc0s9gia9n0966w7169aswpg7knw2pmwrqa204r2v19z"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-mint" ,rust-mint-0.5)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/servo/euclid")
    (synopsis "Geometry primitives")
    (description "Geometry primitives")
    (license (list license:expat license:asl2.0))))

(define-public rust-lyon-geom-0.14
  (package
    (name "rust-lyon-geom")
    (version "0.14.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lyon_geom" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "178z4cqqmyw0rsabbgx9phkjxjzcnq0604062lqjlq87k063216a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-euclid" ,rust-euclid-0.20)
         ("rust-arrayvec" ,rust-arrayvec-0.4)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/nical/lyon")
    (synopsis
      "2D quadratic and cubic bÃ©zier arcs and line segment math on top of euclid.")
    (description
      "2D quadratic and cubic bÃ©zier arcs and line segment math on top of euclid.")
    (license (list license:expat license:asl2.0))))

(define-public rust-lyon-path-0.14
  (package
    (name "rust-lyon-path")
    (version "0.14.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lyon_path" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0qk8x46w0sf6j04l6gvhgn9kr4ymcqkmkh67w8wqahm54jn5gjqb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lyon-geom" ,rust-lyon-geom-0.14)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/nical/lyon")
    (synopsis
      "Types and utilities to store, build and iterate over 2D paths.")
    (description
      "Types and utilities to store, build and iterate over 2D paths.")
    (license (list license:expat license:asl2.0))))

(define-public rust-font-kit-0.4
  (package
    (name "rust-font-kit")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "font-kit" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fmg1jmqdvsjxjbyz8chpx1mhp544mwq128ns1shhrha5a6zzdqp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lyon-path" ,rust-lyon-path-0.14)
         ("rust-core-graphics" ,rust-core-graphics-0.17)
         ("rust-float-ord" ,rust-float-ord-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-euclid" ,rust-euclid-0.20)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-servo-fontconfig"
          ,rust-servo-fontconfig-0.4)
         ("rust-freetype" ,rust-freetype-0.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6)
         ("rust-memmap" ,rust-memmap-0.7)
         ("rust-dwrote" ,rust-dwrote-0.9)
         ("rust-dirs" ,rust-dirs-1.0)
         ("rust-byteorder" ,rust-byteorder-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-core-text" ,rust-core-text-13.3)
         ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page "https://github.com/servo/font-kit")
    (synopsis
      "A cross-platform font loading library")
    (description
      "This package provides a cross-platform font loading library")
    (license (list license:expat license:asl2.0))))

(define-public rust-anyhow-1.0
  (package
    (name "rust-anyhow")
    (version "1.0.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "anyhow" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0g6mzcxyj88k8bv8rr3zx4yczgimqvvgr12n14a29sqj6s1zc9bq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/anyhow")
    (synopsis
      "Flexible concrete Error type built on std::error::Error")
    (description
      "Flexible concrete Error type built on std::error::Error")
    (license (list license:expat license:asl2.0))))

(define-public rust-weedle-0.10
  (package
    (name "rust-weedle")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "weedle" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0r0i2kllvkn9jil6cjzxdi1zsc6p1gjyk751w8lyclaii1q3zd1v"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nom" ,rust-nom-4.2))))
    (home-page "https://github.com/rustwasm/weedle")
    (synopsis "A WebIDL Parser")
    (description
      "This package provides a WebIDL Parser")
    (license license:expat)))

(define-public rust-wasm-bindgen-webidl-0.2
  (package
    (name "rust-wasm-bindgen-webidl")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-webidl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0pcpaw8w3xgfrg9y24ljrsl2bkidgdaaz3ka2bgk417wjc6jl0gg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-weedle" ,rust-weedle-0.10)
         ("rust-wasm-bindgen-backend"
          ,rust-wasm-bindgen-backend-0.2)
         ("rust-heck" ,rust-heck-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-anyhow" ,rust-anyhow-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Support for parsing WebIDL specific to wasm-bindgen
")
    (description
      "Support for parsing WebIDL specific to wasm-bindgen
")
    (license (list license:expat license:asl2.0))))

(define-public rust-web-sys-0.3
  (package
    (name "rust-web-sys")
    (version "0.3.35")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "web-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0fzmxcyahy3ghl8lkjkchj9krmnr56shvbqgr7db3hm8dappryda"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-sourcefile" ,rust-sourcefile-0.1)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-wasm-bindgen-webidl"
          ,rust-wasm-bindgen-webidl-0.2)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-env-logger" ,rust-env-logger-0.7)
         ("rust-anyhow" ,rust-anyhow-1.0))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/web-sys/index.html")
    (synopsis
      "Bindings for all Web APIs, a procedurally generated crate from WebIDL
")
    (description
      "Bindings for all Web APIs, a procedurally generated crate from WebIDL
")
    (license (list license:expat license:asl2.0))))

(define-public rust-piston-gfx-texture-0.40
  (package
    (name "rust-piston-gfx-texture")
    (version "0.40.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-gfx_texture" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1nr5awdgk3njfvfanszrv4gxz93f6skid1c8yijswccygripchqz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gfx" ,rust-gfx-0.18)
         ("rust-image" ,rust-image-0.22)
         ("rust-piston-texture" ,rust-piston-texture-0.8)
         ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page
      "https://github.com/pistondevelopers/gfx_texture")
    (synopsis
      "A Gfx texture representation that works nicely with Piston libraries")
    (description
      "This package provides a Gfx texture representation that works nicely with Piston libraries")
    (license license:expat)))

(define-public rust-piston-shaders-graphics2d-0.3
  (package
    (name "rust-piston-shaders-graphics2d")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-shaders_graphics2d" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1dhh9bv4q19gdnj9d1nqq0yrvzs6gcn0c5j1p1f3xzyzq7d1gg4p"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/PistonDevelopers/shaders")
    (synopsis "Shaders for 2D graphics in Rust")
    (description "Shaders for 2D graphics in Rust")
    (license license:expat)))

(define-public rust-piston2d-gfx-graphics-0.66
  (package
    (name "rust-piston2d-gfx-graphics")
    (version "0.66.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston2d-gfx_graphics" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1pmlkf5rl6pr0c1lqm0059xwj9pwlws7gaq9w6r9d916di6fzki1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gfx" ,rust-gfx-0.18)
         ("rust-piston-shaders-graphics2d"
          ,rust-piston-shaders-graphics2d-0.3)
         ("rust-piston2d-graphics"
          ,rust-piston2d-graphics-0.35)
         ("rust-piston-gfx-texture"
          ,rust-piston-gfx-texture-0.40)
         ("rust-shader-version" ,rust-shader-version-0.6)
         ("rust-draw-state" ,rust-draw-state-0.8))))
    (home-page
      "https://github.com/PistonDevelopers/gfx_graphics")
    (synopsis
      "A Gfx 2D back-end for the Piston game engine")
    (description
      "This package provides a Gfx 2D back-end for the Piston game engine")
    (license license:expat)))

(define-public rust-gleam-0.6
  (package
    (name "rust-gleam")
    (version "0.6.20")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gleam" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ma4n66amyqn4wy73ymnpsxvqf5f1zlp5mqqzj5x5xnpl0wpix6g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.13))))
    (home-page "https://github.com/servo/gleam")
    (synopsis
      "Generated OpenGL bindings and wrapper for Servo.")
    (description
      "Generated OpenGL bindings and wrapper for Servo.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cgl-0.2
  (package
    (name "rust-cgl")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cgl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0j8ayr8pbwvyv6l8r7m5z197rs3pqn97085w9j4rfn7yfh5yrrsm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-gleam" ,rust-gleam-0.6))))
    (home-page "https://github.com/servo/cgl-rs")
    (synopsis "Rust bindings for CGL on Mac")
    (description "Rust bindings for CGL on Mac")
    (license (list license:expat license:asl2.0))))

(define-public rust-wayland-server-0.21
  (package
    (name "rust-wayland-server")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-server" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ayn4wlrpg0fw04prri9awpkjvbzjil0d3l3a8zs9pdbnspvw6ah"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nix" ,rust-nix-0.14)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-wayland-commons"
          ,rust-wayland-commons-0.21)
         ("rust-wayland-scanner"
          ,rust-wayland-scanner-0.21)
         ("rust-wayland-sys" ,rust-wayland-sys-0.21)
         ("rust-calloop" ,rust-calloop-0.4)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-downcast-rs" ,rust-downcast-rs-1.1)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "Bindings to the standard C implementation of the wayland protocol, server side.")
    (description
      "Bindings to the standard C implementation of the wayland protocol, server side.")
    (license license:expat)))

(define-public rust-wayland-protocols-0.21
  (package
    (name "rust-wayland-protocols")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-protocols" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0i91yh3nxk9llhly2ly3nvlfx0lbpvyq919cgmnyx3j25bmf5zaa"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-wayland-commons"
          ,rust-wayland-commons-0.21)
         ("rust-wayland-scanner"
          ,rust-wayland-scanner-0.21)
         ("rust-wayland-client" ,rust-wayland-client-0.21)
         ("rust-wayland-server" ,rust-wayland-server-0.21)
         ("rust-wayland-sys" ,rust-wayland-sys-0.21)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "Generated API for the officials wayland protocol extensions")
    (description
      "Generated API for the officials wayland protocol extensions")
    (license license:expat)))

(define-public rust-line-drawing-0.7
  (package
    (name "rust-line-drawing")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "line_drawing" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fcna7hq1g1kkkqy07hydscx5d2zgb6gskz3vnsvsif8h8ysvisw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2))))
    (home-page
      "https://github.com/expenses/line_drawing")
    (synopsis
      "A collection of line-drawing algorithms for use in graphics and video games.")
    (description
      "This package provides a collection of line-drawing algorithms for use in graphics and video games.")
    (license license:expat)))

(define-public rust-andrew-0.2
  (package
    (name "rust-andrew")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "andrew" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0pmklwcwy8g1jras46fz8xcny779zfqpg4riksrbdhkjk3w0jzwv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-line-drawing" ,rust-line-drawing-0.7)
         ("rust-rusttype" ,rust-rusttype-0.7)
         ("rust-xml-rs" ,rust-xml-rs-0.8)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-xdg" ,rust-xdg-2.2)
         ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page "https://github.com/trimental/andrew")
    (synopsis
      "The andrew crate provides convenient drawing of objects such as shapes, lines and text to buffers")
    (description
      "The andrew crate provides convenient drawing of objects such as shapes, lines and text to buffers")
    (license license:expat)))

(define-public rust-smithay-client-toolkit-0.4
  (package
    (name "rust-smithay-client-toolkit")
    (version "0.4.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "smithay-client-toolkit" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1yj8yzd0lhqpsgq0x4iikl9a02q2hnkky81brk938alv0ibqrjrc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nix" ,rust-nix-0.14)
         ("rust-andrew" ,rust-andrew-0.2)
         ("rust-wayland-client" ,rust-wayland-client-0.21)
         ("rust-wayland-commons"
          ,rust-wayland-commons-0.21)
         ("rust-wayland-protocols"
          ,rust-wayland-protocols-0.21)
         ("rust-dlib" ,rust-dlib-0.4)
         ("rust-memmap" ,rust-memmap-0.7)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page
      "https://github.com/smithay/client-toolkit")
    (synopsis
      "Toolkit for making client wayland applications.")
    (description
      "Toolkit for making client wayland applications.")
    (license license:expat)))

(define-public rust-raw-window-handle-0.3
  (package
    (name "rust-raw-window-handle")
    (version "0.3.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "raw-window-handle" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "04c2wir7qq3g2b143yav52a1g5ack8ffqx2bpmrn9bc0dix1li0a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/rust-windowing/raw-window-handle")
    (synopsis
      "Interoperability library for Rust Windowing applications.")
    (description
      "Interoperability library for Rust Windowing applications.")
    (license license:expat)))

(define-public rust-tiff-0.2
  (package
    (name "rust-tiff")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tiff" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1kn7psgpacns337vvqh272rkqwnakmjd51rc7ygwnc03ibr38j0y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lzw" ,rust-lzw-0.10)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-num-derive" ,rust-num-derive-0.2)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/image-rs/image-tiff")
    (synopsis
      "TIFF decoding and encoding library in pure Rust")
    (description
      "TIFF decoding and encoding library in pure Rust")
    (license license:expat)))

(define-public rust-png-0.14
  (package
    (name "rust-png")
    (version "0.14.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "png" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0nf3a8r9p9zrj4x30b48f7yv18dz9xkmrq9b3lnzmpnhzn0z9nk3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-iter" ,rust-num-iter-0.1)
         ("rust-inflate" ,rust-inflate-0.4)
         ("rust-deflate" ,rust-deflate-0.7)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/image-rs/image-png.git")
    (synopsis
      "PNG decoding and encoding library in pure Rust")
    (description
      "PNG decoding and encoding library in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-image-0.21
  (package
    (name "rust-image")
    (version "0.21.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "image" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1sv534xp8yyn7jj0q6yn2bgng1350f962g81sv8v7c6pgi31wdrm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
         ("rust-num-iter" ,rust-num-iter-0.1)
         ("rust-scoped-threadpool"
          ,rust-scoped-threadpool-0.1)
         ("rust-lzw" ,rust-lzw-0.10)
         ("rust-gif" ,rust-gif-0.10)
         ("rust-png" ,rust-png-0.14)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-tiff" ,rust-tiff-0.2)
         ("rust-num-rational" ,rust-num-rational-0.2)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
      "Imaging library written in Rust. Provides basic filters and decoders for the most common image formats.")
    (description
      "Imaging library written in Rust.  Provides basic filters and decoders for the most common image formats.")
    (license license:expat)))

(define-public rust-mio-extras-2.0
  (package
    (name "rust-mio-extras")
    (version "2.0.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "mio-extras" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "069gfhlv0wlwfx1k2sriwfws490kjp490rv2qivyfb01j3i3yh2j"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-slab" ,rust-slab-0.4)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-lazycell" ,rust-lazycell-1.2))))
    (home-page
      "https://github.com/dimbleby/mio-extras")
    (synopsis "Extra components for use with Mio")
    (description "Extra components for use with Mio")
    (license (list license:expat license:asl2.0))))

(define-public rust-calloop-0.4
  (package
    (name "rust-calloop")
    (version "0.4.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "calloop" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0q6ic9lr0s86886mbyn4yncg68b2sykgwjf3iygdw01swmxhk8ks"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nix" ,rust-nix-0.14)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-mio-extras" ,rust-mio-extras-2.0))))
    (home-page "https://github.com/Smithay/calloop")
    (synopsis "A callback-based event loop")
    (description
      "This package provides a callback-based event loop")
    (license license:expat)))

(define-public rust-wayland-scanner-0.21
  (package
    (name "rust-wayland-scanner")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-scanner" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "17mp49v7w0p0x5ry628lj2llljnwkr9aj9g4bqqhfibid32jhf5z"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-0.4)
         ("rust-quote" ,rust-quote-0.6)
         ("rust-xml-rs" ,rust-xml-rs-0.8))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "Wayland Scanner for generating rust APIs from XML wayland protocol files. Intented for use with wayland-sys. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings.")
    (description
      "Wayland Scanner for generating rust APIs from XML wayland protocol files.  Intented for use with wayland-sys.  You should only need this crate if you are working on custom wayland protocol extensions.  Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-dlib-0.4
  (package
    (name "rust-dlib")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dlib" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0smp2cdvy12xfw26qyqms273w5anszfadv73g75s88yqm54i5rbp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libloading" ,rust-libloading-0.5))))
    (home-page "https://github.com/vberger/dlib")
    (synopsis
      "Helper macros for handling manually loading optional system libraries.")
    (description
      "Helper macros for handling manually loading optional system libraries.")
    (license license:expat)))

(define-public rust-wayland-sys-0.21
  (package
    (name "rust-wayland-sys")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0a0ndgkg98pvmkv44yya4f7mxzjaxylknqh64bpa05w0azyv02jj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-dlib" ,rust-dlib-0.4)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "FFI bindings to the various libwayland-*.so libraries. You should only need this crate if you are working on custom wayland protocol extensions. Look at the crate wayland-client for usable bindings.")
    (description
      "FFI bindings to the various libwayland-*.so libraries.  You should only need this crate if you are working on custom wayland protocol extensions.  Look at the crate wayland-client for usable bindings.")
    (license license:expat)))

(define-public rust-wayland-commons-0.21
  (package
    (name "rust-wayland-commons")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-commons" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1v1jpcsnn6cwwy5ii5pdl58i6b9slmi8mn4my4fpwrlbfsb8ih20"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nix" ,rust-nix-0.14)
         ("rust-wayland-sys" ,rust-wayland-sys-0.21))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "Common types and structures used by wayland-client and wayland-server.")
    (description
      "Common types and structures used by wayland-client and wayland-server.")
    (license license:expat)))

(define-public rust-wayland-client-0.21
  (package
    (name "rust-wayland-client")
    (version "0.21.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wayland-client" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "04r7dy074hhdalsi1day482wvmczr40hg7qvrnzkgxpakrgkx5j9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nix" ,rust-nix-0.14)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-wayland-commons"
          ,rust-wayland-commons-0.21)
         ("rust-wayland-scanner"
          ,rust-wayland-scanner-0.21)
         ("rust-wayland-sys" ,rust-wayland-sys-0.21)
         ("rust-calloop" ,rust-calloop-0.4)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-downcast-rs" ,rust-downcast-rs-1.1)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/smithay/wayland-rs")
    (synopsis
      "Bindings to the standard C implementation of the wayland protocol, client side.")
    (description
      "Bindings to the standard C implementation of the wayland protocol, client side.")
    (license license:expat)))

(define-public rust-winit-0.19
  (package
    (name "rust-winit")
    (version "0.19.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winit" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1a4lnfyvlc4jabhs30wlmkgdjv7qhbplmyp833kl7ykjni5yp5hy"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-core-graphics" ,rust-core-graphics-0.17)
         ("rust-cocoa" ,rust-cocoa-0.18)
         ("rust-android-glue" ,rust-android-glue-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-objc" ,rust-objc-0.2)
         ("rust-wayland-client" ,rust-wayland-client-0.21)
         ("rust-image" ,rust-image-0.21)
         ("rust-raw-window-handle"
          ,rust-raw-window-handle-0.3)
         ("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-smithay-client-toolkit"
          ,rust-smithay-client-toolkit-0.4)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6)
         ("rust-parking-lot" ,rust-parking-lot-0.9)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-percent-encoding"
          ,rust-percent-encoding-2.1)
         ("rust-x11-dl" ,rust-x11-dl-2.18))))
    (home-page
      "https://github.com/rust-windowing/winit")
    (synopsis
      "Cross-platform window creation library.")
    (description
      "Cross-platform window creation library.")
    (license license:asl2.0)))

(define-public rust-cocoa-0.18
  (package
    (name "rust-cocoa")
    (version "0.18.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cocoa" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0m6fgdr4d2fp8jhkqvwr23hrqqqjv72g0j9vdgijc58k05j9j1hp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-block" ,rust-block-0.1)
         ("rust-core-graphics" ,rust-core-graphics-0.17)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-objc" ,rust-objc-0.2)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/servo/core-foundation-rs")
    (synopsis "Bindings to Cocoa for macOS")
    (description "Bindings to Cocoa for macOS")
    (license (list license:expat license:asl2.0))))

(define-public rust-sha1-0.2
  (package
    (name "rust-sha1")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sha1" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0p09zfhd27z6yr5in07gfjcx345010rw51ivlcf14364x3hv2c6c"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/mitsuhiko/rust-sha1")
    (synopsis
      "Minimal implementation of SHA1 for Rust.")
    (description
      "Minimal implementation of SHA1 for Rust.")
    (license license:bsd-3)))

(define-public rust-uuid-0.5
  (package
    (name "rust-uuid")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "uuid" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "08nw3famk1w1zf9ck32pmklk24wd4n4nqnr9wl46qvxak2wf7ixw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-sha1" ,rust-sha1-0.2)
         ("rust-rand" ,rust-rand-0.3)
         ("rust-rustc-serialize"
          ,rust-rustc-serialize-0.3)
         ("rust-md5" ,rust-md5-0.3)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis
      "A library to generate and parse UUIDs.")
    (description
      "This package provides a library to generate and parse UUIDs.")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-foundation-0.6
  (package
    (name "rust-core-foundation")
    (version "0.6.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "core-foundation" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0va97wf49c8dzm9c8pgyk1jn7z21rl0bj1syf2zz5m2z2hzy1f95"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-uuid" ,rust-uuid-0.5)
         ("rust-core-foundation-sys"
          ,rust-core-foundation-sys-0.6))))
    (home-page
      "https://github.com/servo/core-foundation-rs")
    (synopsis
      "Bindings to Core Foundation for macOS")
    (description
      "Bindings to Core Foundation for macOS")
    (license (list license:expat license:asl2.0))))

(define-public rust-core-graphics-0.17
  (package
    (name "rust-core-graphics")
    (version "0.17.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "core-graphics" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1acm3vygngnilzlr6klym5ywh7kfzh2xxrh2l41152hwmdl0jyan"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-foreign-types" ,rust-foreign-types-0.3)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/servo/core-graphics-rs")
    (synopsis "Bindings to Core Graphics for macOS")
    (description
      "Bindings to Core Graphics for macOS")
    (license (list license:expat license:asl2.0))))

(define-public rust-x11-dl-2.18
  (package
    (name "rust-x11-dl")
    (version "2.18.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "x11-dl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1y7yq4sfvv56shk4v3s7gvlrwk9d0migj622fl4i4c5klpiq3y9b"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-maybe-uninit" ,rust-maybe-uninit-2.0))))
    (home-page
      "https://github.com/erlepereira/x11-rs.git")
    (synopsis "X11 library bindings for Rust")
    (description "X11 library bindings for Rust")
    (license license:expat)))

(define-public rust-glutin-glx-sys-0.1
  (package
    (name "rust-glutin-glx-sys")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin_glx_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hq970xnc6l122rx8pa82pirscdr5xnq526702hmxkynfkg47hh8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.13)
         ("rust-x11-dl" ,rust-x11-dl-2.18))))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis "The glx bindings for glutin")
    (description "The glx bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-wgl-sys-0.1
  (package
    (name "rust-glutin-wgl-sys")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin_wgl_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0spbjkzzyn8mmfn0d9zipik21kkibvr1y51pyk0fmzm0wdzblgd9"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.13))))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis "The wgl bindings for glutin")
    (description "The wgl bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-gles2-sys-0.1
  (package
    (name "rust-glutin-gles2-sys")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin_gles2_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1q6scyshfvsz4i1jakylc1cnz33m14q5q8j5wi9qxjzbdgcm7s07"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.13)
         ("rust-objc" ,rust-objc-0.2))))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis "The gles2 bindings for glutin")
    (description "The gles2 bindings for glutin")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.13
  (package
    (name "rust-gl-generator")
    (version "0.13.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl_generator" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0jpqjqpyrl73sf8y20p5rv50qz8glnsvv9infg8h4vi52zgbp66a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-xml-rs" ,rust-xml-rs-0.8)
         ("rust-khronos-api" ,rust-khronos-api-3))))
    (home-page
      "https://github.com/brendanzab/gl-rs/")
    (synopsis
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (description
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-glutin-egl-sys-0.1
  (package
    (name "rust-glutin-egl-sys")
    (version "0.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin_egl_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0k1x1frdp4wp47qkai8zzmgqxzpfcn7780m29qgd92lbnbrxwbkp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.13)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis "The egl bindings for glutin")
    (description "The egl bindings for glutin")
    (license license:asl2.0)))

(define-public rust-osmesa-sys-0.1
  (package
    (name "rust-osmesa-sys")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "osmesa-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0fq1q1zcgfb0qydrg9r2738jlwc4hqxgb9vj11z72bjxx7kfrkw8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-shared-library" ,rust-shared-library-0.1))))
    (home-page
      "https://github.com/Daggerbot/osmesa-rs.git")
    (synopsis "OSMesa library bindings for Rust")
    (description "OSMesa library bindings for Rust")
    (license license:cc0)))

(define-public rust-glutin-emscripten-sys-0.1
  (package
    (name "rust-glutin-emscripten-sys")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin_emscripten_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1wb3qfxg3jh6ibb7bxmlmvf4jcpzck3pn0035g1sds3nvx343pl0"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis "The emscripten bindings for glutin")
    (description
      "The emscripten bindings for glutin")
    (license license:asl2.0)))

(define-public rust-glutin-0.21
  (package
    (name "rust-glutin")
    (version "0.21.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "glutin" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ggyyqn7dvz4yx5ygqfvnxwfb78wvdm5y6xqw5my1b4x61dv6wak"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-glutin-emscripten-sys"
          ,rust-glutin-emscripten-sys-0.1)
         ("rust-osmesa-sys" ,rust-osmesa-sys-0.1)
         ("rust-glutin-egl-sys" ,rust-glutin-egl-sys-0.1)
         ("rust-glutin-gles2-sys"
          ,rust-glutin-gles2-sys-0.1)
         ("rust-glutin-wgl-sys" ,rust-glutin-wgl-sys-0.1)
         ("rust-glutin-glx-sys" ,rust-glutin-glx-sys-0.1)
         ("rust-core-graphics" ,rust-core-graphics-0.17)
         ("rust-cocoa" ,rust-cocoa-0.18)
         ("rust-winit" ,rust-winit-0.19)
         ("rust-android-glue" ,rust-android-glue-0.2)
         ("rust-cgl" ,rust-cgl-0.2)
         ("rust-objc" ,rust-objc-0.2)
         ("rust-wayland-client" ,rust-wayland-client-0.21)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-libloading" ,rust-libloading-0.5)
         ("rust-core-foundation"
          ,rust-core-foundation-0.6)
         ("rust-parking-lot" ,rust-parking-lot-0.9)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page
      "https://github.com/rust-windowing/glutin")
    (synopsis
      "Cross-platform OpenGL context provider.")
    (description
      "Cross-platform OpenGL context provider.")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.10
  (package
    (name "rust-gl-generator")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl_generator" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0146yd4i9wbgfrhnkc04w7n7civbanznc0q87skp6v7p7hbszzx0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-xml-rs" ,rust-xml-rs-0.8)
         ("rust-khronos-api" ,rust-khronos-api-3))))
    (home-page
      "https://github.com/brendanzab/gl-rs/")
    (synopsis
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (description
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-gl-0.11
  (package
    (name "rust-gl")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1wcqpyhck0xriffkmgmldy33lwk2044hb4l02d44vm4fbvicin6p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.10))))
    (home-page
      "https://github.com/brendanzab/gl-rs/")
    (synopsis "OpenGL bindings")
    (description "OpenGL bindings")
    (license license:asl2.0)))

(define-public rust-pistoncore-glutin-window-0.63
  (package
    (name "rust-pistoncore-glutin-window")
    (version "0.63.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-glutin_window" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0dhbyxarv5i742d400bmqdqq3f8c25kcgcg0xavrc18dc913rixc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl" ,rust-gl-0.11)
         ("rust-glutin" ,rust-glutin-0.21)
         ("rust-pistoncore-input"
          ,rust-pistoncore-input-0.28)
         ("rust-pistoncore-window"
          ,rust-pistoncore-window-0.44)
         ("rust-shader-version" ,rust-shader-version-0.6))))
    (home-page
      "https://github.com/pistondevelopers/glutin_window")
    (synopsis
      "A Piston window back-end using the Glutin library")
    (description
      "This package provides a Piston window back-end using the Glutin library")
    (license license:expat)))

(define-public rust-shader-version-0.6
  (package
    (name "rust-shader-version")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "shader_version" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1yk651xc9irl3pl0rlplypzyzy44d0j03ji0j7hjjdjknwzpi3j7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-piston-graphics-api-version"
          ,rust-piston-graphics-api-version-0.2))))
    (home-page
      "https://github.com/pistondevelopers/shader_version")
    (synopsis
      "A helper library for detecting and picking compatible shaders")
    (description
      "This package provides a helper library for detecting and picking compatible shaders")
    (license license:expat)))

(define-public rust-pistoncore-event-loop-0.49
  (package
    (name "rust-pistoncore-event-loop")
    (version "0.49.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-event_loop" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1h9ij9vx42xg39198yxdlpk842pli5jqm2kwswiv3bqqcji0fwsm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pistoncore-input"
          ,rust-pistoncore-input-0.28)
         ("rust-pistoncore-window"
          ,rust-pistoncore-window-0.44))))
    (home-page
      "https://github.com/PistonDevelopers/piston")
    (synopsis
      "A Piston event loop for games and interactive applications")
    (description
      "This package provides a Piston event loop for games and interactive applications")
    (license license:expat)))

(define-public rust-piston-graphics-api-version-0.2
  (package
    (name "rust-piston-graphics-api-version")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-graphics_api_version" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1b5p6s45jqv057lpbxkiq3yrdjjhvcynmi2vjf8292rf0yh4hky5"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/PistonDevelopers/graphics_api_version")
    (synopsis
      "A library for storing graphics API versions")
    (description
      "This package provides a library for storing graphics API versions")
    (license license:expat)))

(define-public rust-pistoncore-window-0.44
  (package
    (name "rust-pistoncore-window")
    (version "0.44.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-window" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "18qy3nnpb9jczvkiyzzznamck0pzgiyi6073jrkldnci6b3in10q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-piston-graphics-api-version"
          ,rust-piston-graphics-api-version-0.2)
         ("rust-pistoncore-input"
          ,rust-pistoncore-input-0.28))))
    (home-page
      "https://github.com/PistonDevelopers/piston")
    (synopsis "A library for window abstraction")
    (description
      "This package provides a library for window abstraction")
    (license license:expat)))

(define-public rust-pistoncore-input-0.28
  (package
    (name "rust-pistoncore-input")
    (version "0.28.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pistoncore-input" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1rrcz9px098m3nx98gvrvzirfdp3vg03cblfkcrp4wnvswc0hwq5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-piston-viewport"
          ,rust-piston-viewport-1.0)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/PistonDevelopers/piston")
    (synopsis "A structure for user input")
    (description
      "This package provides a structure for user input")
    (license license:expat)))

(define-public rust-piston-0.49
  (package
    (name "rust-piston")
    (version "0.49.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1y0rbw92mzagqmwk79wv9axq0m7aid0s0d5cppyzh33wrxhdl3xj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pistoncore-input"
          ,rust-pistoncore-input-0.28)
         ("rust-pistoncore-window"
          ,rust-pistoncore-window-0.44)
         ("rust-pistoncore-event-loop"
          ,rust-pistoncore-event-loop-0.49))))
    (home-page
      "https://github.com/PistonDevelopers/piston")
    (synopsis
      "The Piston game engine core libraries")
    (description
      "The Piston game engine core libraries")
    (license license:expat)))

(define-public rust-vecmath-1.0
  (package
    (name "rust-vecmath")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vecmath" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0shmj76rj7rqv377vy365xwr5rx23kxqgkqxxrymdjjvv3hf2slm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-piston-float" ,rust-piston-float-1.0))))
    (home-page
      "https://github.com/pistondevelopers/vecmath")
    (synopsis
      "A simple and type agnostic library for vector math designed for reexporting")
    (description
      "This package provides a simple and type agnostic library for vector math designed for reexporting")
    (license license:expat)))

(define-public rust-read-color-1.0
  (package
    (name "rust-read-color")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "read_color" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1np0pk31ak7hni4hri3m75mbf8py1wdfjshmrj5krbd4p9c8hk4z"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/read_color")
    (synopsis
      "A simple library for reading hex colors")
    (description
      "This package provides a simple library for reading hex colors")
    (license (list license:expat license:asl2.0))))

(define-public rust-piston-float-1.0
  (package
    (name "rust-piston-float")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-float" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0r35aasycms79hf2vf1ap40kkp8ywgl4hmfkf762dq8jwd3vw07r"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/float")
    (synopsis
      "Traits for generic floats in game development")
    (description
      "Traits for generic floats in game development")
    (license license:expat)))

(define-public rust-piston-viewport-1.0
  (package
    (name "rust-piston-viewport")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-viewport" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "16378hcy41b7x3zj2z4har0wq6fl4r62kf9p106jjl8hg2dv3aq1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-piston-float" ,rust-piston-float-1.0))))
    (home-page
      "https://github.com/PistonDevelopers/viewport")
    (synopsis
      "A library for storing viewport information")
    (description
      "This package provides a library for storing viewport information")
    (license license:expat)))

(define-public rust-piston-texture-0.8
  (package
    (name "rust-piston-texture")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston-texture" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1pcv5my49b8xzqcb87wqh2ndgvr4s9ipys96s0h9j2plxrj3bjb2"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/texture")
    (synopsis "A generic library for textures")
    (description
      "This package provides a generic library for textures")
    (license license:expat)))

(define-public rust-ordered-float-1.0
  (package
    (name "rust-ordered-float")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ordered-float" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0625x96987kspdxbikry5mb7hsf5pdc5bbanxd8wjwqlx0ar71hq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/reem/rust-ordered-float")
    (synopsis
      "Wrappers for total ordering on floats")
    (description
      "Wrappers for total ordering on floats")
    (license license:expat)))

(define-public rust-stb-truetype-0.3
  (package
    (name "rust-stb-truetype")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "stb_truetype" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lgvnh3ma6cz811bk8imj45djz76zs47b8327sgnmik2x03nnyzp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libm" ,rust-libm-0.2)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://gitlab.redox-os.org/redox-os/stb_truetype-rs")
    (synopsis
      "A straight translation of the font loading code in stb_truetype.h from C to Rust.")
    (description
      "This package provides a straight translation of the font loading code in stb_truetype.h from C to Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rusttype-0.8
  (package
    (name "rust-rusttype")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rusttype" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "12hwfg85iii7sbgsyyr23yw862dzp7f8zwn9xv5iqydm5w1i3a8l"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libm" ,rust-libm-0.2)
         ("rust-stb-truetype" ,rust-stb-truetype-0.3)
         ("rust-approx" ,rust-approx-0.3)
         ("rust-arrayvec" ,rust-arrayvec-0.5)
         ("rust-linked-hash-map"
          ,rust-linked-hash-map-0.5)
         ("rust-crossbeam-utils"
          ,rust-crossbeam-utils-0.7)
         ("rust-crossbeam-deque"
          ,rust-crossbeam-deque-0.7)
         ("rust-ordered-float" ,rust-ordered-float-1.0)
         ("rust-rustc-hash" ,rust-rustc-hash-1.1)
         ("rust-num-cpus" ,rust-num-cpus-1.12))))
    (home-page
      "https://gitlab.redox-os.org/redox-os/rusttype")
    (synopsis
      "A pure Rust alternative to libraries like FreeType.

RustType provides an API for loading, querying and rasterising TrueType fonts.

It also provides an implementation of a dynamic GPU glyph cache for hardware font rendering.
")
    (description
      "This package provides a pure Rust alternative to libraries like FreeType.

RustType provides an API for loading, querying and rasterising TrueType fonts.

It also provides an implementation of a dynamic GPU glyph cache for hardware font rendering.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-rusttype-0.7
  (package
    (name "rust-rusttype")
    (version "0.7.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rusttype" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1m9ms4p94cgif74y1rzkj04rx8i1la193c0jgvnip61rd904429i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rusttype" ,rust-rusttype-0.8))))
    (home-page
      "https://gitlab.redox-os.org/redox-os/rusttype")
    (synopsis
      "A pure Rust alternative to libraries like FreeType.

RustType provides an API for loading, querying and rasterising TrueType fonts.

It also provides an implementation of a dynamic GPU glyph cache for hardware font rendering.
")
    (description
      "This package provides a pure Rust alternative to libraries like FreeType.

RustType provides an API for loading, querying and rasterising TrueType fonts.

It also provides an implementation of a dynamic GPU glyph cache for hardware font rendering.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-interpolation-0.2
  (package
    (name "rust-interpolation")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "interpolation" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00icvvgc72zdgyrwwg2p0wad4hry4d2vd6l9iqpyjpmw5dykbdyk"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/pistondevelopers/interpolation")
    (synopsis "A library for interpolation")
    (description
      "This package provides a library for interpolation")
    (license license:expat)))

(define-public rust-piston2d-graphics-0.35
  (package
    (name "rust-piston2d-graphics")
    (version "0.35.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston2d-graphics" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1dx2fanxc2pj76hc5l72x0fh4qg9gchjlr8rmbhdk6jpggcmq56g"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-interpolation" ,rust-interpolation-0.2)
         ("rust-rusttype" ,rust-rusttype-0.7)
         ("rust-piston-texture" ,rust-piston-texture-0.8)
         ("rust-piston-viewport"
          ,rust-piston-viewport-1.0)
         ("rust-read-color" ,rust-read-color-1.0)
         ("rust-vecmath" ,rust-vecmath-1.0)
         ("rust-fnv" ,rust-fnv-1.0))))
    (home-page
      "https://github.com/pistondevelopers/graphics")
    (synopsis
      "A library for 2D graphics that works with multiple back-ends")
    (description
      "This package provides a library for 2D graphics that works with multiple back-ends")
    (license license:expat)))

(define-public rust-gfx-0.18
  (package
    (name "rust-gfx")
    (version "0.18.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0nqmxqi3x4ni0g78g77a6aldrv8cfvzhnpqhxyd2ap4aa3wldph1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-mint" ,rust-mint-0.5)
         ("rust-draw-state" ,rust-draw-state-0.8)
         ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis
      "A high-performance, bindless graphics API")
    (description
      "This package provides a high-performance, bindless graphics API")
    (license license:asl2.0)))

(define-public rust-draw-state-0.8
  (package
    (name "rust-draw-state")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "draw_state" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lfng4fz9x7bwsmzv9r20ply10w0iid6vfcrhx292s6hw8vrbkrk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/gfx-rs/draw_state")
    (synopsis "Graphics state blocks for gfx-rs")
    (description "Graphics state blocks for gfx-rs")
    (license license:asl2.0)))

(define-public rust-gfx-core-0.9
  (package
    (name "rust-gfx-core")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_core" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0haldr99n12d90vqgvl77n59hywlklhdff85j2aljaz1yapdvyvm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-mint" ,rust-mint-0.5)
         ("rust-draw-state" ,rust-draw-state-0.8)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "Core library of Gfx-rs")
    (description "Core library of Gfx-rs")
    (license license:asl2.0)))

(define-public rust-gl-generator-0.14
  (package
    (name "rust-gl-generator")
    (version "0.14.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gl_generator" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0k8j1hmfnff312gy7x1aqjzcm8zxid7ij7dlb8prljib7b1dz58s"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-xml-rs" ,rust-xml-rs-0.8)
         ("rust-khronos-api" ,rust-khronos-api-3))))
    (home-page
      "https://github.com/brendanzab/gl-rs/")
    (synopsis
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (description
      "Code generators for creating bindings to the Khronos OpenGL APIs.")
    (license license:asl2.0)))

(define-public rust-gfx-gl-0.6
  (package
    (name "rust-gfx-gl")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_gl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ppzj4bgjawdqz3fvnscqk8lnmgh95pwzh0v96vwy809cxj83lzj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gl-generator" ,rust-gl-generator-0.14))))
    (home-page "https://github.com/gfx-rs/gfx_gl")
    (synopsis
      "OpenGL bindings for gfx, based on gl-rs")
    (description
      "OpenGL bindings for gfx, based on gl-rs")
    (license license:asl2.0)))

(define-public rust-gfx-device-gl-0.16
  (package
    (name "rust-gfx-device-gl")
    (version "0.16.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gfx_device_gl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1g5yg19jvxdmviljyakhd6253bnb2qg7v8iscf48ihc0ldgki70h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-gfx-gl" ,rust-gfx-gl-0.6)
         ("rust-gfx-core" ,rust-gfx-core-0.9))))
    (home-page "https://github.com/gfx-rs/gfx")
    (synopsis "OpenGL backend for gfx-rs")
    (description "OpenGL backend for gfx-rs")
    (license license:asl2.0)))

(define-public rust-piston-window-0.105
  (package
    (name "rust-piston-window")
    (version "0.105.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "piston_window" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05n2905gkp5ck25kbq95ia6pj1xz63dpp247jz3xcw1d41xpvi95"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gfx-device-gl" ,rust-gfx-device-gl-0.16)
         ("rust-gfx" ,rust-gfx-0.18)
         ("rust-piston2d-graphics"
          ,rust-piston2d-graphics-0.35)
         ("rust-piston" ,rust-piston-0.49)
         ("rust-shader-version" ,rust-shader-version-0.6)
         ("rust-pistoncore-glutin-window"
          ,rust-pistoncore-glutin-window-0.63)
         ("rust-piston2d-gfx-graphics"
          ,rust-piston2d-gfx-graphics-0.66)
         ("rust-piston-texture" ,rust-piston-texture-0.8))))
    (home-page
      "https://github.com/pistondevelopers/piston_window")
    (synopsis
      "The official Piston window wrapper for the Piston game engine")
    (description
      "The official Piston window wrapper for the Piston game engine")
    (license license:expat)))

(define-public rust-plotters-0.2
  (package
    (name "rust-plotters")
    (version "0.2.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plotters" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ssycy9an23vs9hq098c7kl1dvp5ych20d994lhsw9vx4kdbhfsf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gif" ,rust-gif-0.10)
         ("rust-piston-window" ,rust-piston-window-0.105)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-image" ,rust-image-0.22)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-web-sys" ,rust-web-sys-0.3)
         ("rust-font-kit" ,rust-font-kit-0.4)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-palette" ,rust-palette-0.5)
         ("rust-cairo-rs" ,rust-cairo-rs-0.7)
         ("rust-rusttype" ,rust-rusttype-0.8)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page "https://github.com/38/plotters")
    (synopsis
      "A Rust drawing library focus on data plotting for both WASM and native applications")
    (description
      "This package provides a Rust drawing library focus on data plotting for both WASM and native applications")
    (license license:expat)))

(define-public rust-criterion-0.3
  (package
    (name "rust-criterion")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "criterion" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1lgpr82rlmg6rm4gr3c3pla2xgxnakbf8w9sabjsig8jkikmbiqz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-plotters" ,rust-plotters-0.2)
         ("rust-atty" ,rust-atty-0.2)
         ("rust-cast" ,rust-cast-0.2)
         ("rust-criterion-plot" ,rust-criterion-plot-0.4)
         ("rust-itertools" ,rust-itertools-0.8)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-tinytemplate" ,rust-tinytemplate-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-csv" ,rust-csv-1.1)
         ("rust-rayon" ,rust-rayon-1.3)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-oorandom" ,rust-oorandom-11.1)
         ("rust-walkdir" ,rust-walkdir-2.3)
         ("rust-clap" ,rust-clap-2))))
    (home-page
      "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis
      "Statistics-driven micro-benchmarking library")
    (description
      "Statistics-driven micro-benchmarking library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-vergen-3.0
  (package
    (name "rust-vergen")
    (version "3.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "vergen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fhx18f0ddlc779f27s3gdzg4mliishrhnyhz8fhbirxz4s5xfka"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-failure" ,rust-failure-0.1)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page "http://github.com/rustyhorde/vergen")
    (synopsis "Generate version related functions")
    (description
      "Generate version related functions")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-proc-macro-0.4
  (package
    (name "rust-rust-hawktracer-proc-macro")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer_proc_macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qfksscfv8rbbzv2zb0i9sbbqmig0dr0vrma3c1kzsfmpsynlqnb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rust-hawktracer-sys"
          ,rust-rust-hawktracer-sys-0.4))))
    (home-page
      "https://github.com/AlexEne/rust_hawktracer_proc_macro")
    (synopsis
      "helper crate for hawktracer profiling library.")
    (description
      "helper crate for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-either-1.5
  (package
    (name "rust-either")
    (version "1.5.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "either" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qyz1b1acad6w0k5928jw5zaq900zhsk7p8dlcp4hh61w4f6n7xv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/bluss/either")
    (synopsis
      "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.
")
    (description
      "The enum `Either` with variants `Left` and `Right` is a general purpose sum type with two cases.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-itertools-0.8
  (package
    (name "rust-itertools")
    (version "0.8.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "itertools" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1154j48aw913v5jnyhpxialxhdn2sfpl4d7bwididyb1r05jsspm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-either" ,rust-either-1.5))))
    (home-page
      "https://github.com/bluss/rust-itertools")
    (synopsis
      "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (description
      "Extra iterator adaptors, iterator methods, free functions, and macros.")
    (license (list license:expat license:asl2.0))))

(define-public rust-which-1.0
  (package
    (name "rust-which")
    (version "1.0.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "which" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1cjwa57kzfgzs681a27m5pjmq580pv3hkcg23smf270bgqz60jp8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/harryfei/which-rs.git")
    (synopsis
      "A Rust equivalent of Unix command \"which\". Locate installed executable in cross platforms.")
    (description
      "This package provides a Rust equivalent of Unix command \"which\".  Locate installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-proc-macro2-0.3
  (package
    (name "rust-proc-macro2")
    (version "0.3.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro2" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ryaynnaj39l4zphcg5w8wszndd80vsrv89m5d2293gl6pry41hv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-xid" ,rust-unicode-xid-0.1))))
    (home-page
      "https://github.com/alexcrichton/proc-macro2")
    (synopsis
      "A stable implementation of the upcoming new `proc_macro` API. Comes with an
option, off by default, to also reimplement itself in terms of the upstream
unstable API.
")
    (description
      "This package provides a stable implementation of the upcoming new `proc_macro` API.  Comes with an
option, off by default, to also reimplement itself in terms of the upstream
unstable API.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-quote-0.5
  (package
    (name "rust-quote")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quote" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1s01fh0jl8qv4xggs85yahw0h507nzrxkjbf7vay3zw8d3kcyjcr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro2" ,rust-proc-macro2-0.3))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "Quasi-quoting macro quote!(...)")
    (license (list license:expat license:asl2.0))))

;(define-public rust-proc-macro2-0.3
;  (package
;    (name "rust-proc-macro2")
;    (version "0.3.5")
;    (source
;      (origin
;        (method url-fetch)
;        (uri (crate-uri "proc-macro2" version))
;        (file-name
;          (string-append name "-" version ".tar.gz"))
;        (sha256
;          (base32
;            "1m0ksg6hbm46zblq0dpkwrg3n1h7n90yq1zcgwc6vpbfmr9pr6bp"))))
;    (build-system cargo-build-system)
;    (arguments
;      `(#:skip-build?
;        #t
;        #:cargo-inputs
;        (("rust-unicode-xid" ,rust-unicode-xid-0.1))))
;    (home-page
;      "https://github.com/alexcrichton/proc-macro2")
;    (synopsis
;      "A stable implementation of the upcoming new `proc_macro` API. Comes with an
;option, off by default, to also reimplement itself in terms of the upstream
;unstable API.
;")
;    (description
;      "This package provides a stable implementation of the upcoming new `proc_macro` API.  Comes with an
;option, off by default, to also reimplement itself in terms of the upstream
;unstable API.
;")
;    (license (list license:expat license:asl2.0))))

(define-public rust-clang-sys-0.23
  (package
    (name "rust-clang-sys")
    (version "0.23.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "clang-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hjr333izzhs6bic84qwnyzy5xzmvasib8f3zkzj4ln3a97c1xyp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-glob" ,rust-glob-0.2)
         ("rust-glob" ,rust-glob-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-libloading" ,rust-libloading-0.5))))
    (home-page
      "https://github.com/KyleMayes/clang-sys")
    (synopsis "Rust bindings for libclang.")
    (description "Rust bindings for libclang.")
    (license license:asl2.0)))

(define-public rust-term-0.6
  (package
    (name "rust-term")
    (version "0.6.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "term" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ddqxq9hrk8zqq1f8pqhz72vrlfc8vh2xcza2gb623z78lrkm1n0"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3)
         ("rust-dirs" ,rust-dirs-2.0))))
    (home-page "https://github.com/Stebalien/term")
    (synopsis "A terminal formatting library
")
    (description
      "This package provides a terminal formatting library
")
    (license (list license:expat license:asl2.0))))

(define-public rust-tester-0.6
  (package
    (name "rust-tester")
    (version "0.6.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tester" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0kqynxab4g4qyhrmw8y7pzfn267q31wa7gbsirfkg17b6bbycivn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-getopts" ,rust-getopts-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-term" ,rust-term-0.6))))
    (home-page
      "https://github.com/messense/rustc-test")
    (synopsis
      "A fork of Rustâ\x80\x99s `test` crate that doesnâ\x80\x99t require unstable language features.")
    (description
      "This package provides a fork of Rustâ\x80\x99s `test` crate that doesnâ\x80\x99t require unstable language features.")
    (license (list license:expat license:asl2.0))))

(define-public rust-diff-0.1
  (package
    (name "rust-diff")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "diff" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "16b40bhsa2qgvgvxs983l625pkxyp6m0mzmpwg2605cvj53yl98f"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/utkarshkukreti/diff.rs")
    (synopsis
      "An LCS based slice and string diffing implementation.")
    (description
      "An LCS based slice and string diffing implementation.")
    (license (list license:expat license:asl2.0))))

(define-public rust-compiletest-rs-0.3
  (package
    (name "rust-compiletest-rs")
    (version "0.3.26")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "compiletest_rs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ipskgfs86cd3gy6hqb0qm2m0jdngqvh4s3rc1k8pbgb0ib9gn6p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-diff" ,rust-diff-0.1)
         ("rust-getopts" ,rust-getopts-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-filetime" ,rust-filetime-0.2)
         ("rust-miow" ,rust-miow-0.3)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-rustfix" ,rust-rustfix-0.4)
         ("rust-tester" ,rust-tester-0.6)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page
      "https://github.com/laumann/compiletest-rs")
    (synopsis
      "The compiletest utility from the Rust compiler as a standalone testing harness")
    (description
      "The compiletest utility from the Rust compiler as a standalone testing harness")
    (license (list license:asl2.0 license:expat))))

(define-public rust-lazy-static-0.2
  (package
    (name "rust-lazy-static")
    (version "0.2.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "lazy_static" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0wxy8vak7jsx6r8gx475pjqpx11p2bfq4wvw6idmqi31mp3k7w3n"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-compiletest-rs" ,rust-compiletest-rs-0.3)
         ("rust-spin" ,rust-spin-0.4))))
    (home-page
      "https://github.com/rust-lang-nursery/lazy-static.rs")
    (synopsis
      "A macro for declaring lazily evaluated statics in Rust.")
    (description
      "This package provides a macro for declaring lazily evaluated statics in Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-nom-3.2
  (package
    (name "rust-nom")
    (version "3.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nom" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0yr8fazcspgawl6s7wmx5llz61s68jl88cnrph18fa7xf06cbbh5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-compiler-error" ,rust-compiler-error-0.1)
         ("rust-lazy-static" ,rust-lazy-static-0.2)
         ("rust-regex" ,rust-regex-0.2)
         ("rust-memchr" ,rust-memchr-1.0))))
    (home-page "https://github.com/Geal/nom")
    (synopsis
      "A byte-oriented, zero-copy, parser combinators library")
    (description
      "This package provides a byte-oriented, zero-copy, parser combinators library")
    (license license:expat)))

(define-public rust-cexpr-0.2
  (package
    (name "rust-cexpr")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cexpr" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0v1xa3758czmj8h97gh548mr8g0v13ixxvrlm1s79nb7jmgc9aj2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nom" ,rust-nom-3.2))))
    (home-page
      "https://github.com/jethrogb/rust-cexpr")
    (synopsis "A C expression parser and evaluator")
    (description
      "This package provides a C expression parser and evaluator")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bindgen-0.37
  (package
    (name "rust-bindgen")
    (version "0.37.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "08f2cyzr8fc027mzj2lhmn5j3w318g2ql7yfw5ngxa3yhy1an98v"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-peeking-take-while"
          ,rust-peeking-take-while-0.1)
         ("rust-cexpr" ,rust-cexpr-0.2)
         ("rust-clang-sys" ,rust-clang-sys-0.23)
         ("rust-proc-macro2" ,rust-proc-macro2-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-env-logger" ,rust-env-logger-0.5)
         ("rust-quote" ,rust-quote-0.5)
         ("rust-which" ,rust-which-1.0)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-clap" ,rust-clap-2))))
    (home-page
      "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-rust-hawktracer-sys-0.4
  (package
    (name "rust-rust-hawktracer-sys")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "15acrj881y2g7cwsgf1nr22cixrknp8m4x08dkx1an6zf4q8bk37"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cmake" ,rust-cmake-0.1)
         ("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-bindgen" ,rust-bindgen-0.37)
         ("rust-itertools" ,rust-itertools-0.8))))
    (home-page
      "https://github.com/AlexEne/rust_hawktracer_sys")
    (synopsis
      "sys crate for the rust_hawktracer library")
    (description
      "sys crate for the rust_hawktracer library")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-normal-macro-0.4
  (package
    (name "rust-rust-hawktracer-normal-macro")
    (version "0.4.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri
               "rust_hawktracer_normal_macro"
               version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1sfjmipdbb5s498c150czr6wihjlkwwgla2jyg3cs7cyjich0mwa"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rust-hawktracer-sys"
          ,rust-rust-hawktracer-sys-0.4))))
    (home-page
      "https://github.com/AlexEne/rust_hawktracer_normal_macro")
    (synopsis
      "helper crate for hawktracer profiling library.")
    (description
      "helper crate for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-rust-hawktracer-0.7
  (package
    (name "rust-rust-hawktracer")
    (version "0.7.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rust_hawktracer" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1h9an3b73pmhhpzc2kk93nh93lplkvsffysj0rp6rxi7p4lhlj73"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rust-hawktracer-normal-macro"
          ,rust-rust-hawktracer-normal-macro-0.4)
         ("rust-rust-hawktracer-proc-macro"
          ,rust-rust-hawktracer-proc-macro-0.4))))
    (home-page
      "https://github.com/AlexEne/rust_hawktracer")
    (synopsis
      "Rust bindings for hawktracer profiling library.")
    (description
      "Rust bindings for hawktracer profiling library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-error-chain-0.11
  (package
    (name "rust-error-chain")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "error-chain" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1wykkr0naizbkwxjwia1rch8xhwvgij9khqvjzs07mrmqifislgz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page
      "https://github.com/rust-lang-nursery/error-chain")
    (synopsis
      "Yet another error boilerplate library.")
    (description
      "Yet another error boilerplate library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syslog-4.0
  (package
    (name "rust-syslog")
    (version "4.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syslog" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "09ykcbvwx8icvf303mqyz76ji8j6fgyyx97zpr23s788ni112r50"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-time" ,rust-time-0.1)
         ("rust-error-chain" ,rust-error-chain-0.11)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/Geal/rust-syslog")
    (synopsis "Send log messages to syslog")
    (description "Send log messages to syslog")
    (license license:expat)))

(define-public rust-unix-socket-0.5
  (package
    (name "rust-unix-socket")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "unix_socket" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0r0mxf3mmqvimnx4mpks1f6c4haj6jcxc0k9bs7w61f42w2718ka"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/rust-lang-nursery/unix-socket")
    (synopsis "Unix domain socket bindings")
    (description "Unix domain socket bindings")
    (license (list license:expat license:asl2.0))))

(define-public rust-log-0.3
  (package
    (name "rust-log")
    (version "0.3.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "log" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0jq23hhn5h35k7pa8r7wqnsywji6x3wn1q5q7lif5q536if8v7p1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis
      "A lightweight logging facade for Rust
")
    (description
      "This package provides a lightweight logging facade for Rust
")
    (license (list license:expat license:asl2.0))))

(define-public rust-syslog-3.3
  (package
    (name "rust-syslog")
    (version "3.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syslog" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0hpdnk2zm6xawpz6fv6qbn0ncfm5p0wm5c6gq7yhaz2gvsnb1jdv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-time" ,rust-time-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-log" ,rust-log-0.3)
         ("rust-unix-socket" ,rust-unix-socket-0.5))))
    (home-page "https://github.com/Geal/rust-syslog")
    (synopsis "Send log messages to syslog")
    (description "Send log messages to syslog")
    (license license:expat)))

(define-public rust-atty-0.2
  (package
    (name "rust-atty")
    (version "0.2.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "atty" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1s7yslcs6a28c5vz7jwj63lkfgyx8mx99fdirlhi9lbhhzhrpcyr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-hermit-abi" ,rust-hermit-abi-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/softprops/atty")
    (synopsis "A simple interface for querying atty")
    (description
      "This package provides a simple interface for querying atty")
    (license license:expat)))

(define-public rust-colored-1.9
  (package
    (name "rust-colored")
    (version "1.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "colored" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0gaviala6knn5xxz8hqf4h53526fxvxl3q9jzhl9k9gkg2my45c8"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-atty" ,rust-atty-0.2)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page "https://github.com/mackwic/colored")
    (synopsis
      "The most simple way to add colors in your terminal")
    (description
      "The most simple way to add colors in your terminal")
    (license license:mpl2.0)))

(define-public rust-js-sys-0.3
  (package
    (name "rust-js-sys")
    (version "0.3.35")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "js-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ybwazllkbif71i195dadgrsw64k6l04ggk5yimiy5c2cb1wg2bq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.
")
    (description
      "Bindings for all JS global objects and functions in all JS environments like
Node.js and browsers, built on `#[wasm_bindgen]` using the `wasm-bindgen` crate.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-bumpalo-3.2
  (package
    (name "rust-bumpalo")
    (version "3.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bumpalo" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0hpp4wfcn04gnl1ji4a80b85xwknsci81xqyllq174gq9z0rsd8z"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/fitzgen/bumpalo")
    (synopsis
      "A fast bump allocation arena for Rust.")
    (description
      "This package provides a fast bump allocation arena for Rust.")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-shared-0.2
  (package
    (name "rust-wasm-bindgen-shared")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-shared" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00cnbabf4k9bahb217vkilmjwqwzpwp112vlvgfw1x19r4gydrzm"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.
")
    (description
      "Shared support between wasm-bindgen and wasm-bindgen cli, an internal
dependency.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-backend-0.2
  (package
    (name "rust-wasm-bindgen-backend")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-backend" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0icskn0qlj30np6x6nbyl1i9dndckx0pczaq69dm42r92rcbkk8i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-wasm-bindgen-shared"
          ,rust-wasm-bindgen-shared-0.2)
         ("rust-log" ,rust-log-0.4)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-bumpalo" ,rust-bumpalo-3.2))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Backend code generation of the wasm-bindgen tool
")
    (description
      "Backend code generation of the wasm-bindgen tool
")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-support-0.2
  (package
    (name "rust-wasm-bindgen-macro-support")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-macro-support" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0s3n7v741i4wkzib41m126li40qlhqyirnxpigkypsi59wsk2l78"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-wasm-bindgen-backend"
          ,rust-wasm-bindgen-backend-0.2)
         ("rust-wasm-bindgen-shared"
          ,rust-wasm-bindgen-shared-0.2)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate
")
    (description
      "The part of the implementation of the `#[wasm_bindgen]` attribute that is not in the shared backend crate
")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-macro-0.2
  (package
    (name "rust-wasm-bindgen-macro")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen-macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hwxw0nhi2n4izhjn2fvnrrn59xqjxs3ybkgzdv1b4p65ivr8h2p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-wasm-bindgen-macro-support"
          ,rust-wasm-bindgen-macro-support-0.2)
         ("rust-quote" ,rust-quote-1.0))))
    (home-page
      "https://rustwasm.github.io/wasm-bindgen/")
    (synopsis
      "Definition of the `#[wasm_bindgen]` attribute, an internal dependency
")
    (description
      "Definition of the `#[wasm_bindgen]` attribute, an internal dependency
")
    (license (list license:expat license:asl2.0))))

(define-public rust-wasm-bindgen-0.2
  (package
    (name "rust-wasm-bindgen")
    (version "0.2.58")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "wasm-bindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0v31s91andxcj73w63g3fkbw3ld6cfsaa4135qcjna22vypyj1aj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-wasm-bindgen-macro"
          ,rust-wasm-bindgen-macro-0.2)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://rustwasm.github.io/")
    (synopsis
      "Easy support for interacting between JS and Rust.
")
    (description
      "Easy support for interacting between JS and Rust.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-chrono-0.4
  (package
    (name "rust-chrono")
    (version "0.4.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "chrono" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "00dw7k11hmkm7yhc1v9pi0lrk0n28k4r3rh9g9pk3bkb9m50p19i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-time" ,rust-time-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
         ("rust-rustc-serialize"
          ,rust-rustc-serialize-0.3)
         ("rust-js-sys" ,rust-js-sys-0.3)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/chronotope/chrono")
    (synopsis "Date and time library for Rust")
    (description "Date and time library for Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-reopen-0.3
  (package
    (name "rust-reopen")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "reopen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "12b3mfxkwb8akdfa701nzvqr6lsc6n84vrq088gmjy8lxlmr4an6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-signal-hook" ,rust-signal-hook-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page "https://github.com/vorner/reopen")
    (synopsis "File reopening utility")
    (description "File reopening utility")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fern-0.5
  (package
    (name "rust-fern")
    (version "0.5.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fern" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1anslk0hx9an4ypcaxqff080hgbcxm7ji7d4qf4f6qx1mkav16p6"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-reopen" ,rust-reopen-0.3)
         ("rust-chrono" ,rust-chrono-0.4)
         ("rust-log" ,rust-log-0.4)
         ("rust-colored" ,rust-colored-1.9)
         ("rust-syslog" ,rust-syslog-3.3)
         ("rust-syslog" ,rust-syslog-4.0))))
    (home-page "https://github.com/daboross/fern")
    (synopsis "Simple, efficient logging")
    (description "Simple, efficient logging")
    (license license:expat)))

(define-public rust-y4m-0.5
  (package
    (name "rust-y4m")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "y4m" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "06g8c53qk4cla3xczywx5qlklvzsw54x77vm727mhizlsp5n93ar"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/image-rs/y4m")
    (synopsis "YUV4MPEG2 (.y4m) Encoder/Decoder.")
    (description "YUV4MPEG2 (.y4m) Encoder/Decoder.")
    (license license:expat)))

(define-public rust-bindgen-0.52
  (package
    (name "rust-bindgen")
    (version "0.52.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0mzy2gjiaggl602yn4a11xzrxfj18kl7pwqa5yv32njkxd257j7i"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-shlex" ,rust-shlex-0.1)
         ("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-peeking-take-while"
          ,rust-peeking-take-while-0.1)
         ("rust-clang-sys" ,rust-clang-sys-0.28)
         ("rust-cexpr" ,rust-cexpr-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-env-logger" ,rust-env-logger-0.7)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0)
         ("rust-rustc-hash" ,rust-rustc-hash-1.1)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazycell" ,rust-lazycell-1.2)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-clap" ,rust-clap-2)
         ("rust-which" ,rust-which-3.1))))
    (home-page
      "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-dav1d-sys-0.3
  (package
    (name "rust-dav1d-sys")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "dav1d-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1022czzp3s54r42x6rhr870w1fwzyp7b6qn0zirpz55zmqjpgnwa"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-bindgen" ,rust-bindgen-0.52)
         ("rust-metadeps" ,rust-metadeps-1.1))))
    (home-page "https://github.com/rust-av/dav1d-rs")
    (synopsis "FFI bindings to dav1d")
    (description "FFI bindings to dav1d")
    (license license:expat)))

(define-public rust-num-derive-0.3
  (package
    (name "rust-num-derive")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0imprwv8cs01k46g56ajlvc97dp8kz51y2vn6cp9jkw1c6r1b2qc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/rust-num/num-derive")
    (synopsis "Numeric syntax extensions")
    (description "Numeric syntax extensions")
    (license (list license:expat license:asl2.0))))

(define-public rust-arg-enum-proc-macro-0.3
  (package
    (name "rust-arg-enum-proc-macro")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arg_enum_proc_macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "021rr6j3n031ynfbm7kwb3j3bxvbsz40n0nqi78k47d3p92rihcv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/lu-zero/arg_enum_proc_macro")
    (synopsis
      "A procedural macro compatible with clap arg_enum")
    (description
      "This package provides a procedural macro compatible with clap arg_enum")
    (license license:expat)))

(define-public rust-num-derive-0.2
  (package
    (name "rust-num-derive")
    (version "0.2.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1wnv7776fh4i40r3zfxcxcmm0dh029skx7gp4sjknz2kqm2hpzga"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-0.15)
         ("rust-proc-macro2" ,rust-proc-macro2-0.4)
         ("rust-quote" ,rust-quote-0.6))))
    (home-page
      "https://github.com/rust-num/num-derive")
    (synopsis "Numeric syntax extensions")
    (description "Numeric syntax extensions")
    (license (list license:expat license:asl2.0))))

(define-public rust-tiff-0.3
  (package
    (name "rust-tiff")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tiff" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0zgmbny2f8rssqmjdfvnysy0vqwcvlwl6q9f5yixhavlqk7w5dyp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lzw" ,rust-lzw-0.10)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-num-derive" ,rust-num-derive-0.2)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/image-rs/image-tiff")
    (synopsis
      "TIFF decoding and encoding library in pure Rust")
    (description
      "TIFF decoding and encoding library in pure Rust")
    (license license:expat)))

(define-public rust-quickcheck-macros-0.8
  (package
    (name "rust-quickcheck-macros")
    (version "0.8.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "quickcheck_macros" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0b3mhn0xcrdd3fkbkx3rghhivwzwil8w991ngp6gaj70l72c3pyp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-0.15)
         ("rust-proc-macro2" ,rust-proc-macro2-0.4)
         ("rust-quote" ,rust-quote-0.6))))
    (home-page
      "https://github.com/BurntSushi/quickcheck")
    (synopsis "A macro attribute for quickcheck.")
    (description
      "This package provides a macro attribute for quickcheck.")
    (license (list license:unlicense license:expat))))

(define-public rust-num-bigint-0.2
  (package
    (name "rust-num-bigint")
    (version "0.2.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-bigint" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "015k3wixdi4w698sappvy43pf8bvkw0f88xplmdgc3zfk2cpy309"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-rand" ,rust-rand-0.5)
         ("rust-quickcheck-macros"
          ,rust-quickcheck-macros-0.8)
         ("rust-quickcheck" ,rust-quickcheck-0.8)
         ("rust-autocfg" ,rust-autocfg-1.0)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/rust-num/num-bigint")
    (synopsis "Big integer implementation for Rust")
    (description
      "Big integer implementation for Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-rational-0.2
  (package
    (name "rust-num-rational")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num-rational" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "18q3vq3xldhaj0z3f92am8f59m1awywgdj28c7wvx0bcksgwfkfs"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-num-integer" ,rust-num-integer-0.1)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-num-bigint" ,rust-num-bigint-0.2)
         ("rust-autocfg" ,rust-autocfg-1.0)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/rust-num/num-rational")
    (synopsis
      "Rational numbers implementation for Rust")
    (description
      "Rational numbers implementation for Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-gzip-header-0.3
  (package
    (name "rust-gzip-header")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gzip-header" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0fg6vm8sgsm69szwqyz7abfbyziv6pv0jkcailimlamvsfrzwc81"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-crc32fast" ,rust-crc32fast-1.2))))
    (home-page
      "https://github.com/oyvindln/gzip-header")
    (synopsis
      "A crate for decoding and encoding the header part of gzip files based on the gzip header
 implementation in the flate2 crate.
")
    (description
      "This package provides a crate for decoding and encoding the header part of gzip files based on the gzip header
 implementation in the flate2 crate.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-deflate-0.7
  (package
    (name "rust-deflate")
    (version "0.7.20")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "deflate" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1d7d9fpmgjnznrksmd3vlv3dyw01wsrm11ifil6ag22871xnlyvh"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-gzip-header" ,rust-gzip-header-0.3)
         ("rust-adler32" ,rust-adler32-1.0)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/image-rs/deflate-rs")
    (synopsis
      "A DEFLATE, zlib and gzip encoder written in rust.
")
    (description
      "This package provides a DEFLATE, zlib and gzip encoder written in rust.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-inflate-0.4
  (package
    (name "rust-inflate")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "inflate" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1zxjdn8iwa0ssxrnjmywm3r1v284wryvzrf8vkc7nyf5ijbjknqw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-adler32" ,rust-adler32-1.0))))
    (home-page
      "https://github.com/PistonDevelopers/inflate.git")
    (synopsis "DEFLATE decoding")
    (description "DEFLATE decoding")
    (license license:expat)))

(define-public rust-png-0.15
  (package
    (name "rust-png")
    (version "0.15.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "png" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "10x2qkhyfnm3si5vgx77r2ik811gaap7ahi825wfxgsb0lirm1gg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-inflate" ,rust-inflate-0.4)
         ("rust-deflate" ,rust-deflate-0.7)
         ("rust-crc32fast" ,rust-crc32fast-1.2)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/image-rs/image-png.git")
    (synopsis
      "PNG decoding and encoding library in pure Rust")
    (description
      "PNG decoding and encoding library in pure Rust")
    (license (list license:expat license:asl2.0))))

(define-public rust-color-quant-1.0
  (package
    (name "rust-color-quant")
    (version "1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "color_quant" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ga56jrafnjm80903nnqjkyii4bwd6a7visxh0g8hgi6cmrvbfqd"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/PistonDevelopers/color_quant.git")
    (synopsis
      "Color quantization library to reduce n colors to 256 colors.")
    (description
      "Color quantization library to reduce n colors to 256 colors.")
    (license license:expat)))

(define-public rust-gif-0.10
  (package
    (name "rust-gif")
    (version "0.10.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gif" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1bw174f7civdfgryvc8pvyhicpr96hzdajnda4s3y8iv3ch907a7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-lzw" ,rust-lzw-0.10)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-color-quant" ,rust-color-quant-1.0))))
    (home-page
      "https://github.com/image-rs/image-gif")
    (synopsis "GIF de- and encoder")
    (description "GIF de- and encoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-jpeg-decoder-0.1
  (package
    (name "rust-jpeg-decoder")
    (version "0.1.18")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "jpeg-decoder" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lc428qgffh2a1agkq0p26mvf9rjaiswpywy5883j99mqypg0mh2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rayon" ,rust-rayon-1.3)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/image-rs/jpeg-decoder")
    (synopsis "JPEG decoder")
    (description "JPEG decoder")
    (license (list license:expat license:asl2.0))))

(define-public rust-image-0.22
  (package
    (name "rust-image")
    (version "0.22.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "image" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0jpbd0p1q7xx6395ba9ikz2k4cfp26qczisa8m2v15w3hzd2mv88"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-jpeg-decoder" ,rust-jpeg-decoder-0.1)
         ("rust-num-iter" ,rust-num-iter-0.1)
         ("rust-scoped-threadpool"
          ,rust-scoped-threadpool-0.1)
         ("rust-gif" ,rust-gif-0.10)
         ("rust-png" ,rust-png-0.15)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-num-rational" ,rust-num-rational-0.2)
         ("rust-tiff" ,rust-tiff-0.3)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/image-rs/image")
    (synopsis
      "Imaging library written in Rust. Provides basic filters and decoders for the most common image formats.")
    (description
      "Imaging library written in Rust.  Provides basic filters and decoders for the most common image formats.")
    (license license:expat)))

(define-public rust-scan-fmt-0.2
  (package
    (name "rust-scan-fmt")
    (version "0.2.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scan_fmt" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gmaa07z8bkkdv5xhq2lrgml6ri7fqyyrjpiks3phmpmq3p8d0i4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-regex" ,rust-regex-1.3))))
    (home-page "https://github.com/wlentz/scan_fmt")
    (synopsis "A simple scanf()-like input for Rust")
    (description
      "This package provides a simple scanf()-like input for Rust")
    (license license:expat)))

(define-public rust-interpolate-name-0.2
  (package
    (name "rust-interpolate-name")
    (version "0.2.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "interpolate_name" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05vzsiqb69d1mbpaphcg4ifjsjs6g03b8pacskfcydqhh555zcxl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/lu-zero/interpolate_name")
    (synopsis
      "Simple procedural macro attribute for repetitive tests")
    (description
      "Simple procedural macro attribute for repetitive tests")
    (license license:expat)))

(define-public rust-rustversion-1.0
  (package
    (name "rust-rustversion")
    (version "1.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustversion" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xkr1g792w728py2qpg2zj0vfviv2xzmxkkd9w6035l9d5ss3fxk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/dtolnay/rustversion")
    (synopsis
      "Conditional compilation according to rustc compiler version")
    (description
      "Conditional compilation according to rustc compiler version")
    (license (list license:expat license:asl2.0))))

(define-public rust-syn-mid-0.5
  (package
    (name "rust-syn-mid")
    (version "0.5.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syn-mid" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "12ikg5jfklixq0wsgfl7sdzjqlxgq50ygklxy4f972hjdjgm7qvv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/taiki-e/syn-mid")
    (synopsis
      "Providing the features between \"full\" and \"derive\" of syn.
")
    (description
      "Providing the features between \"full\" and \"derive\" of syn.
")
    (license (list license:asl2.0 license:expat))))

(define-public rust-proc-macro-error-attr-0.4
  (package
    (name "rust-proc-macro-error-attr")
    (version "0.4.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro-error-attr" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lwjv931536h8bpx6hy0dbq04dgz7w92fmhnwdijx467h7sbwxfi"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn-mid" ,rust-syn-mid-0.5)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-rustversion" ,rust-rustversion-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://gitlab.com/CreepySkeleton/proc-macro-error")
    (synopsis
      "Attribute macro for proc-macro-error crate")
    (description
      "Attribute macro for proc-macro-error crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-error-0.4
  (package
    (name "rust-proc-macro-error")
    (version "0.4.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro-error" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0hpjjci16x9j1h7b9p5fbwlfn6bx90q0b0jz4ja5wzlwyfd3qaq5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-error-attr"
          ,rust-proc-macro-error-attr-0.4)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-rustversion" ,rust-rustversion-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://gitlab.com/CreepySkeleton/proc-macro-error")
    (synopsis
      "Almost drop-in replacement to panics in proc-macros")
    (description
      "Almost drop-in replacement to panics in proc-macros")
    (license (list license:expat license:asl2.0))))

(define-public rust-cargo-metadata-0.6
  (package
    (name "rust-cargo-metadata")
    (version "0.6.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo_metadata" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1givpi2w7iwqqnl87x5yc15zcm5hs6yw490sb6abkfp1h39v9lg5"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-error-chain" ,rust-error-chain-0.12)
         ("rust-semver" ,rust-semver-0.9)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page
      "https://github.com/oli-obk/cargo_metadata")
    (synopsis
      "structured access to the output of `cargo metadata`")
    (description
      "structured access to the output of `cargo metadata`")
    (license license:expat)))

(define-public rust-bytecount-0.4
  (package
    (name "rust-bytecount")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bytecount" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "13qpy38z5wx0rzcdvr2h0ixbfgi1dbrif068il3hwn3k2mah88mr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-packed-simd" ,rust-packed-simd-0.3))))
    (home-page "https://github.com/llogiq/bytecount")
    (synopsis
      "count occurrences of a given byte, or the number of UTF-8 code points, in a byte slice, fast")
    (description
      "count occurrences of a given byte, or the number of UTF-8 code points, in a byte slice, fast")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pulldown-cmark-0.2
  (package
    (name "rust-pulldown-cmark")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pulldown-cmark" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "05gfnqa0wzix5m17jrmgj0yyr9sflqm0knn79ndppsnhcan2zxgf"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-getopts" ,rust-getopts-0.2)
         ("rust-bitflags" ,rust-bitflags-1))))
    (home-page
      "https://github.com/raphlinus/pulldown-cmark")
    (synopsis "A pull parser for CommonMark")
    (description
      "This package provides a pull parser for CommonMark")
    (license license:expat)))

(define-public rust-skeptic-0.13
  (package
    (name "rust-skeptic")
    (version "0.13.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "skeptic" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0rai61hbs65nbvbhqlk1nap5hlav5qx3zmjjjzh9rhgxagc8xyyn"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-error-chain" ,rust-error-chain-0.12)
         ("rust-pulldown-cmark" ,rust-pulldown-cmark-0.2)
         ("rust-glob" ,rust-glob-0.2)
         ("rust-tempdir" ,rust-tempdir-0.3)
         ("rust-bytecount" ,rust-bytecount-0.4)
         ("rust-cargo-metadata" ,rust-cargo-metadata-0.6)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-walkdir" ,rust-walkdir-2.3))))
    (home-page
      "https://github.com/budziq/rust-skeptic")
    (synopsis
      "Test your Rust markdown documentation via Cargo")
    (description
      "Test your Rust markdown documentation via Cargo")
    (license (list license:expat license:asl2.0))))

(define-public rust-err-derive-0.2
  (package
    (name "rust-err-derive")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "err-derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "01sxn404xhl7n29v6vxpicaa9k0x6inz6napwzn4ir204pqq5khl"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-synstructure" ,rust-synstructure-0.12)
         ("rust-skeptic" ,rust-skeptic-0.13)
         ("rust-proc-macro-error"
          ,rust-proc-macro-error-0.4)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-rustversion" ,rust-rustversion-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://gitlab.com/torkleyy/err-derive")
    (synopsis "Derive macro for `std::error::Error`")
    (description
      "Derive macro for `std::error::Error`")
    (license (list license:expat license:asl2.0))))

(define-public rust-noop-proc-macro-0.2
  (package
    (name "rust-noop-proc-macro")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "noop_proc_macro" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0in1l0rjxzs4fylb6zad484z1c58jxyzchhc12k0cjrvm0y6zwsz"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/lu-zero/noop_proc_macro")
    (synopsis
      "No-op proc_macro, literally does nothing")
    (description
      "No-op proc_macro, literally does nothing")
    (license license:expat)))

(define-public rust-bindgen-0.50
  (package
    (name "rust-bindgen")
    (version "0.50.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1fp98x0k4cawil3rqxsfrb58pq3mb5mn37rp745zxfmjfigml3nb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-shlex" ,rust-shlex-0.1)
         ("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-peeking-take-while"
          ,rust-peeking-take-while-0.1)
         ("rust-fxhash" ,rust-fxhash-0.2)
         ("rust-clang-sys" ,rust-clang-sys-0.28)
         ("rust-cexpr" ,rust-cexpr-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-proc-macro2" ,rust-proc-macro2-0.4)
         ("rust-quote" ,rust-quote-0.6)
         ("rust-env-logger" ,rust-env-logger-0.6)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-which" ,rust-which-2.0)
         ("rust-clap" ,rust-clap-2))))
    (home-page
      "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-onig-sys-69.2
  (package
    (name "rust-onig-sys")
    (version "69.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "onig_sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0kjijq29yx05xxg9snvqnfn53dl52hchb4sk3zhfr77mypxlx38a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-pkg-config" ,rust-pkg-config-0.3)
         ("rust-bindgen" ,rust-bindgen-0.50)
         ("rust-cc" ,rust-cc-1.0))))
    (home-page
      "http://github.com/iwillspeak/rust-onig")
    (synopsis
      "The `onig_sys` crate contains raw rust bindings to the
oniguruma library. This crate exposes a set of unsafe
functions which can then be used by other crates to
create safe wrappers around Oniguruma.

You probably don't want to link to this crate directly;
instead check out the `onig` crate.
")
    (description
      "The `onig_sys` crate contains raw rust bindings to the
oniguruma library.  This crate exposes a set of unsafe
functions which can then be used by other crates to
create safe wrappers around Oniguruma.

You probably don't want to link to this crate directly;
instead check out the `onig` crate.
")
    (license license:expat)))

(define-public rust-onig-5.0
  (package
    (name "rust-onig")
    (version "5.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "onig" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ivr0wq1zlyjhhkxpsnmpncg92sjx3rha8pnp3m1mzvgk7y27rz4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-onig-sys" ,rust-onig-sys-69.2))))
    (home-page
      "http://github.com/iwillspeak/rust-onig")
    (synopsis
      "Rust-Onig is a set of Rust bindings for the
Oniguruma regular expression library. Oniguruma
is a modern regex library with support for
multiple character encodings and regex syntaxes.
")
    (description
      "Rust-Onig is a set of Rust bindings for the
Oniguruma regular expression library.  Oniguruma
is a modern regex library with support for
multiple character encodings and regex syntaxes.
")
    (license license:expat)))

(define-public rust-winapi-util-0.1
  (package
    (name "rust-winapi-util")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "winapi-util" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "105dq898nah3dwrzr96vvb5srp6g2v5dl5vmzf211lba9iavzksc"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3))))
    (home-page
      "https://github.com/BurntSushi/winapi-util")
    (synopsis
      "A dumping ground for high level safe wrappers over winapi.")
    (description
      "This package provides a dumping ground for high level safe wrappers over winapi.")
    (license (list license:unlicense license:expat))))

(define-public rust-walkdir-2.3
  (package
    (name "rust-walkdir")
    (version "2.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "walkdir" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0z9g39f49cycdm9vzjf8hnfh3f1csxgd65kmlphj8r2vffy84wbp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-winapi-util" ,rust-winapi-util-0.1)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-same-file" ,rust-same-file-1.0))))
    (home-page
      "https://github.com/BurntSushi/walkdir")
    (synopsis "Recursively walk a directory.")
    (description "Recursively walk a directory.")
    (license (list license:unlicense license:expat))))

(define-public rust-bincode-1.2
  (package
    (name "rust-bincode")
    (version "1.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bincode" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1gvxm3n67xv1874fwxmnlircdlphlk1hcw75ykrrnw9l2nky4lsp"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/servo/bincode")
    (synopsis
      "A binary serialization / deserialization strategy that uses Serde for transforming structs into bytes and vice versa!")
    (description
      "This package provides a binary serialization / deserialization strategy that uses Serde for transforming structs into bytes and vice versa!")
    (license license:expat)))

(define-public rust-itoa-0.4
  (package
    (name "rust-itoa")
    (version "0.4.5")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "itoa" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "13nxqrfnh83a7x5rw4wq2ilp8nxvwy74dxzysdg59dbxqk0agdxq"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/dtolnay/itoa")
    (synopsis
      "Fast functions for printing integer primitives to an io::Write")
    (description
      "Fast functions for printing integer primitives to an io::Write")
    (license (list license:expat license:asl2.0))))

(define-public rust-serde-json-1.0
  (package
    (name "rust-serde-json")
    (version "1.0.48")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde_json" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "09cwggp707hf0qswzrg00nffr09prx99f6qlajqnqbacbpksswck"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-itoa" ,rust-itoa-0.4)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-ryu" ,rust-ryu-1.0)
         ("rust-indexmap" ,rust-indexmap-1.3))))
    (home-page "https://github.com/serde-rs/json")
    (synopsis "A JSON serialization file format")
    (description
      "This package provides a JSON serialization file format")
    (license (list license:expat license:asl2.0))))

(define-public rust-line-wrap-0.1
  (package
    (name "rust-line-wrap")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "line-wrap" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ffa2whkyh9mwvdlpk6v8pjkg8p8mlzyjfymq5adll9a18sl80zk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-safemem" ,rust-safemem-0.3))))
    (home-page
      "https://bitbucket.org/marshallpierce/line-wrap-rs/src")
    (synopsis "Efficiently insert line separators")
    (description
      "Efficiently insert line separators")
    (license license:asl2.0)))

(define-public rust-plist-0.4
  (package
    (name "rust-plist")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "plist" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0zqnxc5i4y6mj119vr0lzpb5j67vffpx2phhgh711533bw3ryajz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-line-wrap" ,rust-line-wrap-0.1)
         ("rust-base64" ,rust-base64-0.10)
         ("rust-xml-rs" ,rust-xml-rs-0.8)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-humantime" ,rust-humantime-1.3)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page
      "https://github.com/ebarnard/rust-plist/")
    (synopsis
      "A rusty plist parser. Supports Serde serialization.")
    (description
      "This package provides a rusty plist parser.  Supports Serde serialization.")
    (license license:expat)))

(define-public rust-syntect-3.3
  (package
    (name "rust-syntect")
    (version "3.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syntect" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1f6qn1yy15b0hq9h6q1rikqnm3lh56ic6bq3ywsmdsjy8ni9splm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-plist" ,rust-plist-0.4)
         ("rust-yaml-rust" ,rust-yaml-rust-0.4)
         ("rust-regex-syntax" ,rust-regex-syntax-0.6)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-serde-derive" ,rust-serde-derive-1.0)
         ("rust-flate2" ,rust-flate2-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-fnv" ,rust-fnv-1.0)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-lazycell" ,rust-lazycell-1.2)
         ("rust-bincode" ,rust-bincode-1.2)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-walkdir" ,rust-walkdir-2.3)
         ("rust-onig" ,rust-onig-5.0))))
    (home-page "https://github.com/trishume/syntect")
    (synopsis
      "library for high quality syntax highlighting and code intelligence using Sublime Text's grammars")
    (description
      "library for high quality syntax highlighting and code intelligence using Sublime Text's grammars")
    (license license:expat)))

(define-public rust-serde-test-1.0
  (package
    (name "rust-serde-test")
    (version "1.0.104")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "serde_test" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "01276bwlamw0bg4aj7nc3mwv0ws0hcza6kj0adxkhi1pikznvy9k"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0))))
    (home-page "https://serde.rs")
    (synopsis
      "Token De/Serializer for testing De/Serialize implementations")
    (description
      "Token De/Serializer for testing De/Serialize implementations")
    (license (list license:expat license:asl2.0))))

(define-public rust-ascii-1.0
  (package
    (name "rust-ascii")
    (version "1.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ascii" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0281gc828q4j692gb66jfdr5k16gyszgqflylh0pp30rllv63xdv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0)
         ("rust-serde-test" ,rust-serde-test-1.0))))
    (home-page
      "https://github.com/tomprogrammer/rust-ascii")
    (synopsis
      "ASCII-only equivalents to `char`, `str` and `String`.")
    (description
      "ASCII-only equivalents to `char`, `str` and `String`.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-encode-unicode-0.3
  (package
    (name "rust-encode-unicode")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "encode_unicode" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "07w3vzrhxh9lpjgsg2y5bwzfar2aq35mdznvcp3zjl0ssj7d4mx3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-clippy" ,rust-clippy-0.0)
         ("rust-ascii" ,rust-ascii-1.0))))
    (home-page
      "https://github.com/tormol/encode_unicode")
    (synopsis
      "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.
")
    (description
      "UTF-8 and UTF-16 character types, iterators and related methods for char, u8 and u16.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-console-0.9
  (package
    (name "rust-console")
    (version "0.9.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "console" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1h765951c9mywff534f0191slazykmif4290g2yarcwhd2cg7q25"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-width" ,rust-unicode-width-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-termios" ,rust-termios-0.3)
         ("rust-encode-unicode" ,rust-encode-unicode-0.3)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-clicolors-control"
          ,rust-clicolors-control-1.0)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page
      "https://github.com/mitsuhiko/console")
    (synopsis
      "A terminal and console abstraction for Rust")
    (description
      "This package provides a terminal and console abstraction for Rust")
    (license license:expat)))

(define-public rust-better-panic-0.2
  (package
    (name "rust-better-panic")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "better-panic" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0xl48v6pd9ys7wp0ni62i6q73xpd1nhf92z09sjc9n3lrj0ac4ix"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-console" ,rust-console-0.9)
         ("rust-syntect" ,rust-syntect-3.3))))
    (home-page
      "https://github.com/mitsuhiko/better-panic")
    (synopsis
      "Pretty panic backtraces inspired by Python's tracebacks.")
    (description
      "Pretty panic backtraces inspired by Python's tracebacks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-arbitrary-0.2
  (package
    (name "rust-arbitrary")
    (version "0.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arbitrary" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1i3fhcdyjq4isn22xx2svmpfr5hwyzi0wavbm07fs8i2dv5pdkv4"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/nagisa/rust_arbitrary/")
    (synopsis
      "The trait for generating structured data from unstructured data")
    (description
      "The trait for generating structured data from unstructured data")
    (license (list license:expat license:asl2.0))))

(define-public rust-nasm-rs-0.1
  (package
    (name "rust-nasm-rs")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "nasm-rs" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0r34hiy1pc0aksrfc02zsl0zyw33i9yi7kyx8l214l7nm0mzm97y"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rayon" ,rust-rayon-1.3))))
    (home-page "https://github.com/medek/nasm-rs")
    (synopsis "Run NASM during your Cargo build.")
    (description "Run NASM during your Cargo build.")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro-hack-0.5
  (package
    (name "rust-proc-macro-hack")
    (version "0.5.11")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "proc-macro-hack" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1idz5vmnjjhvr51yvwyjb45mza18wa53fr05m1skqvbdyw15gm7c"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/dtolnay/proc-macro-hack")
    (synopsis
      "Procedural macros in expression position")
    (description
      "Procedural macros in expression position")
    (license (list license:expat license:asl2.0))))

(define-public rust-paste-impl-0.1
  (package
    (name "rust-paste-impl")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "paste-impl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1ig6ahgh27kdz4midarryzx2y6xdi9za9a8vp11byqgg2blwj522"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis
      "Implementation detail of the `paste` crate")
    (description
      "Implementation detail of the `paste` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-paste-0.1
  (package
    (name "rust-paste")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "paste" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0jdaxr0hpkim6as7ywx7x3f479igxpczj85pfcg8z0kf3jg52fj2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-paste-impl" ,rust-paste-impl-0.1)
         ("rust-proc-macro-hack"
          ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/dtolnay/paste")
    (synopsis
      "Macros for all your token pasting needs")
    (description
      "Macros for all your token pasting needs")
    (license (list license:expat license:asl2.0))))

(define-public rust-toml-0.2
  (package
    (name "rust-toml")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "toml" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1d1cz43bxrx4fd6j2p6myckf81f72bp47akg36y3flxjkhj60svk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustc-serialize"
          ,rust-rustc-serialize-0.3)
         ("rust-serde" ,rust-serde-0.8))))
    (home-page
      "https://github.com/alexcrichton/toml-rs")
    (synopsis
      "A native Rust encoder and decoder of TOML-formatted files and streams. Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
")
    (description
      "This package provides a native Rust encoder and decoder of TOML-formatted files and streams.  Provides
implementations of the standard Serialize/Deserialize traits for TOML data to
facilitate deserializing and serializing Rust structures.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-error-chain-0.10
  (package
    (name "rust-error-chain")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "error-chain" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1y1gyj9g5c3k1nzkvxrgry8v9k86kcc585mczrm3qz019s35shyr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page
      "https://github.com/rust-lang-nursery/error-chain")
    (synopsis
      "Yet another error boilerplate library.")
    (description
      "Yet another error boilerplate library.")
    (license (list license:expat license:asl2.0))))

(define-public rust-metadeps-1.1
  (package
    (name "rust-metadeps")
    (version "1.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "metadeps" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1hjla9ypycqw1snd2qf87cckcc0d5z5qvxpcijn5yrrs3f825cbk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-error-chain" ,rust-error-chain-0.10)
         ("rust-toml" ,rust-toml-0.2)
         ("rust-pkg-config" ,rust-pkg-config-0.3))))
    (home-page
      "https://github.com/joshtriplett/metadeps")
    (synopsis
      "Run pkg-config from declarative dependencies in Cargo.toml")
    (description
      "Run pkg-config from declarative dependencies in Cargo.toml")
    (license (list license:expat license:asl2.0))))

(define-public rust-byteorder-1.3
  (package
    (name "rust-byteorder")
    (version "1.3.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "byteorder" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1pkjfhgjnq898g1d38ygcfi0msg3m6756cwv0sgysj1d26p8mi08"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/BurntSushi/byteorder")
    (synopsis
      "Library for reading/writing numbers in big-endian and little-endian.")
    (description
      "Library for reading/writing numbers in big-endian and little-endian.")
    (license (list license:unlicense license:expat))))

(define-public rust-smallvec-1.2
  (package
    (name "rust-smallvec")
    (version "1.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "smallvec" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1z6f47i3qpg9pdjzzvb0g5i1vvdm2ymk3kqc1mdnl8fdkgnb4bsw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/servo/rust-smallvec")
    (synopsis
      "'Small vector' optimization: store up to a small number of items on the stack")
    (description
      "'Small vector' optimization: store up to a small number of items on the stack")
    (license (list license:expat license:asl2.0))))

(define-public rust-gimli-0.20
  (package
    (name "rust-gimli")
    (version "0.20.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "gimli" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0cz6wg1niwfqf0mk28igsdnsm92cs57cai9jpzdmvw6hma863pc1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-fallible-iterator"
          ,rust-fallible-iterator-0.2)
         ("rust-arrayvec" ,rust-arrayvec-0.5)
         ("rust-stable-deref-trait"
          ,rust-stable-deref-trait-1.1)
         ("rust-smallvec" ,rust-smallvec-1.2)
         ("rust-indexmap" ,rust-indexmap-1.3)
         ("rust-byteorder" ,rust-byteorder-1.3))))
    (home-page "https://github.com/gimli-rs/gimli")
    (synopsis
      "A library for reading and writing the DWARF debugging format.")
    (description
      "This package provides a library for reading and writing the DWARF debugging format.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-afl-0.5
  (package
    (name "rust-afl")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "afl" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0azpi917l8nhvx25n2v670nvkxkrhcwmddfi85qnr6kchmi6y946"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustc-version" ,rust-rustc-version-0.2)
         ("rust-rustc-version" ,rust-rustc-version-0.2)
         ("rust-cc" ,rust-cc-1.0)
         ("rust-xdg" ,rust-xdg-2.2)
         ("rust-xdg" ,rust-xdg-2.2)
         ("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/rust-fuzz/afl.rs")
    (synopsis
      "Fuzzing Rust code with american-fuzzy-lop")
    (description
      "Fuzzing Rust code with american-fuzzy-lop")
    (license license:asl2.0)))

(define-public rust-cpp-demangle-0.2
  (package
    (name "rust-cpp-demangle")
    (version "0.2.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cpp_demangle" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1mm064x84868q06r4m4b7byf999nrkbhx7iyc4nchyssaxpsy5a1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-glob" ,rust-glob-0.3)
         ("rust-afl" ,rust-afl-0.5))))
    (home-page
      "https://github.com/gimli-rs/cpp_demangle")
    (synopsis "A crate for demangling C++ symbols")
    (description
      "This package provides a crate for demangling C++ symbols")
    (license (list license:asl2.0 license:expat))))

(define-public rust-fallible-iterator-0.2
  (package
    (name "rust-fallible-iterator")
    (version "0.2.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "fallible-iterator" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1x31skjsynn2h7sq3qzyv4zlyk2w8jmqcs3phsg4qxhz52yj16qx"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/sfackler/rust-fallible-iterator")
    (synopsis "Fallible iterator traits")
    (description "Fallible iterator traits")
    (license (list license:expat license:asl2.0))))

(define-public rust-indexmap-1.3
  (package
    (name "rust-indexmap")
    (version "1.3.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "indexmap" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "14i2gmq9pwaafvlxmsc12j6539hjgqk4j4jz40fz763vbcn08vq7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-autocfg" ,rust-autocfg-1.0)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-rayon" ,rust-rayon-1.3))))
    (home-page "https://github.com/bluss/indexmap")
    (synopsis
      "A hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys. It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index. A corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed to
indexmap.
")
    (description
      "This package provides a hash table with consistent order and fast iteration.

The indexmap is a hash table where the iteration order of the key-value
pairs is independent of the hash values of the keys.  It has the usual
hash table functionality, it preserves insertion order except after
removals, and it allows lookup of its elements by either hash table key
or numerical index.  A corresponding hash set type is also provided.

This crate was initially published under the name ordermap, but it was renamed to
indexmap.
")
    (license (list license:asl2.0 license:expat))))

(define-public rust-miniz-oxide-0.3
  (package
    (name "rust-miniz-oxide")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "miniz_oxide" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "198n4hfpq0qcxf275l6fpzh7b9cl7ck2xs6pjgpds74bazv9yrxa"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-adler32" ,rust-adler32-1.0))))
    (home-page
      "https://github.com/Frommi/miniz_oxide/tree/master/miniz_oxide")
    (synopsis
      "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (description
      "DEFLATE compression and decompression library rewritten in Rust based on miniz")
    (license license:expat)))

(define-public rust-flate2-1.0
  (package
    (name "rust-flate2")
    (version "1.0.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "flate2" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "03rwyh691j20ih2vcskwp1sinhf9paggrkv32fvzwli9fpsddmkb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-miniz-sys" ,rust-miniz-sys-0.1)
         ("rust-tokio-io" ,rust-tokio-io-0.1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-miniz-oxide" ,rust-miniz-oxide-0.3)
         ("rust-libz-sys" ,rust-libz-sys-1.0)
         ("rust-crc32fast" ,rust-crc32fast-1.2))))
    (home-page
      "https://github.com/alexcrichton/flate2-rs")
    (synopsis
      "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams. Contains bindings for zlib, deflate, and gzip-based
streams.
")
    (description
      "Bindings to miniz.c for DEFLATE compression and decompression exposed as
Reader/Writer streams.  Contains bindings for zlib, deflate, and gzip-based
streams.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-erased-serde-0.3
  (package
    (name "rust-erased-serde")
    (version "0.3.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "erased-serde" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1yfs0jqi5j7wzwx1l7r1wlhkdy0hn6gynly7wdwcvn4vbhq80zfd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/dtolnay/erased-serde")
    (synopsis
      "Type-erased Serialize and Serializer traits")
    (description
      "Type-erased Serialize and Serializer traits")
    (license (list license:expat license:asl2.0))))

(define-public rust-slog-2.5
  (package
    (name "rust-slog")
    (version "2.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "slog" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "16bv6zrdn1sm315vbnia02g31xvsmbjyz5gv3z0vrgxdli0cdj8w"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-erased-serde" ,rust-erased-serde-0.3))))
    (home-page "https://github.com/slog-rs/slog")
    (synopsis
      "Structured, extensible, composable logging for Rust")
    (description
      "Structured, extensible, composable logging for Rust")
    (license
      (list license:mpl2.0
            license:expat
            license:asl2.0))))

(define-public rust-uuid-0.8
  (package
    (name "rust-uuid")
    (version "0.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "uuid" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "049w16qwk3d3b9cmpgvd7fvcnwgs75l8rlsagh06w7ga9dm2zplz"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-winapi" ,rust-winapi-0.3)
         ("rust-sha1" ,rust-sha1-0.6)
         ("rust-md5" ,rust-md5-0.6)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-slog" ,rust-slog-2.5))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis
      "A library to generate and parse UUIDs.")
    (description
      "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-parity-wasm-0.41
  (package
    (name "rust-parity-wasm")
    (version "0.41.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "parity-wasm" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0rfqgjyxrxrfjq5r5n81mdklahl8g4az6yhyyvw25nh0mj6qgz6x"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/paritytech/parity-wasm")
    (synopsis "WebAssembly low-level format library")
    (description
      "WebAssembly low-level format library")
    (license (list license:expat license:asl2.0))))

(define-public rust-target-lexicon-0.10
  (package
    (name "rust-target-lexicon")
    (version "0.10.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "target-lexicon" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "17diw9c3d1vb5rmwwk2ghsyhfs0gj5jm78hrwxxhmd67vhw743mb"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/CraneStation/target-lexicon")
    (synopsis
      "Targeting utilities for compilers and related tools")
    (description
      "Targeting utilities for compilers and related tools")
    (license (list license:asl2.0
;                   unknown-license!
                   ))))

(define-public rust-object-0.17
  (package
    (name "rust-object")
    (version "0.17.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "object" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1bmgbg4k0725lchfy9j1wnpfmywh5qhs0k4k6j2g7c0acvys8i7a"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-goblin" ,rust-goblin-0.1)
         ("rust-target-lexicon" ,rust-target-lexicon-0.10)
         ("rust-scroll" ,rust-scroll-0.10)
         ("rust-parity-wasm" ,rust-parity-wasm-0.41)
         ("rust-uuid" ,rust-uuid-0.8)
         ("rust-flate2" ,rust-flate2-1.0)
         ("rust-crc32fast" ,rust-crc32fast-1.2)
         ("rust-indexmap" ,rust-indexmap-1.3))))
    (home-page "https://github.com/gimli-rs/object")
    (synopsis
      "A unified interface for reading and writing object file formats.")
    (description
      "This package provides a unified interface for reading and writing object file formats.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-addr2line-0.11
  (package
    (name "rust-addr2line")
    (version "0.11.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "addr2line" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0sk5g8cb2yynlcm0wcqff9l9c9ml69rqgfrrbii0ybgdc236jkhw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
         ("rust-object" ,rust-object-0.17)
         ("rust-fallible-iterator"
          ,rust-fallible-iterator-0.2)
         ("rust-cpp-demangle" ,rust-cpp-demangle-0.2)
         ("rust-gimli" ,rust-gimli-0.20)
         ("rust-smallvec" ,rust-smallvec-1.2)
         ("rust-lazycell" ,rust-lazycell-1.2))))
    (home-page
      "https://github.com/gimli-rs/addr2line")
    (synopsis
      "A cross-platform symbolication library written in Rust, using `gimli`")
    (description
      "This package provides a cross-platform symbolication library written in Rust, using `gimli`")
    (license (list license:asl2.0 license:expat))))

(define-public rust-scroll-derive-0.10
  (package
    (name "rust-scroll-derive")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scroll_derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0a7f0xybi27p1njs4bqmxh9zyb2dqal4dbvgnhjjix4zkgm4wn7q"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis
      "A macros 1.1 derive implementation for Pread and Pwrite traits from the scroll crate")
    (description
      "This package provides a macros 1.1 derive implementation for Pread and Pwrite traits from the scroll crate")
    (license license:expat)))

(define-public rust-scroll-0.10
  (package
    (name "rust-scroll")
    (version "0.10.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "scroll" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1cbcns8538sqmfnmdbphqy0fd4j8z75z802pvmz3zlwmnln37cmb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-scroll-derive" ,rust-scroll-derive-0.10))))
    (home-page "https://github.com/m4b/scroll")
    (synopsis
      "A suite of powerful, extensible, generic, endian-aware Read/Write traits for byte buffers")
    (description
      "This package provides a suite of powerful, extensible, generic, endian-aware Read/Write traits for byte buffers")
    (license license:expat)))

(define-public rust-goblin-0.1
  (package
    (name "rust-goblin")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "goblin" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1nn0aa2jf207gbyccxnrzm7n217di025z5y1ybblp7nkk11j309h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-scroll" ,rust-scroll-0.10)
         ("rust-plain" ,rust-plain-0.2)
         ("rust-log" ,rust-log-0.4))))
    (home-page "https://github.com/m4b/goblin")
    (synopsis
      "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate")
    (description
      "An impish, cross-platform, ELF, Mach-o, and PE binary parsing and loading crate")
    (license license:expat)))

(define-public rust-backtrace-0.3
  (package
    (name "rust-backtrace")
    (version "0.3.44")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "backtrace" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0djmbf6caj7qm2p7jw6wzjxc83sji9gdd8vjp9mg2g0gyjdnn0z4"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-rustc-demangle" ,rust-rustc-demangle-0.1)
         ("rust-compiler-builtins"
          ,rust-compiler-builtins-0.1)
         ("rust-goblin" ,rust-goblin-0.1)
         ("rust-backtrace-sys" ,rust-backtrace-sys-0.1)
         ("rust-addr2line" ,rust-addr2line-0.11)
         ("rust-cpp-demangle" ,rust-cpp-demangle-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-rustc-serialize"
          ,rust-rustc-serialize-0.3)
         ("rust-winapi" ,rust-winapi-0.3)
         ("rust-findshlibs" ,rust-findshlibs-0.5)
         ("rust-memmap" ,rust-memmap-0.7)
         ("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page
      "https://github.com/rust-lang/backtrace-rs")
    (synopsis
      "A library to acquire a stack trace (backtrace) at runtime in a Rust program.
")
    (description
      "This package provides a library to acquire a stack trace (backtrace) at runtime in a Rust program.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-synstructure-0.12
  (package
    (name "rust-synstructure")
    (version "0.12.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "synstructure" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0igmc5fzpk6fg7kgff914j05lbpc6ai2wmji312v2h8vvjhnwrb7"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-xid" ,rust-unicode-xid-0.2)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://github.com/mystor/synstructure")
    (synopsis
      "Helper methods and macros for custom derives")
    (description
      "Helper methods and macros for custom derives")
    (license license:expat)))

(define-public rust-failure-derive-0.1
  (package
    (name "rust-failure-derive")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "failure_derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "022xfb9wcs1bdssfm2airsrfxpn2ccpbyh1ld2wf9483isvjbhhb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-synstructure" ,rust-synstructure-0.12)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page
      "https://rust-lang-nursery.github.io/failure/")
    (synopsis "derives for the failure crate")
    (description "derives for the failure crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-failure-0.1
  (package
    (name "rust-failure")
    (version "0.1.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "failure" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1nay5c2cgi40kp84rbiir1dgwlh9aap9jazbnxfmqrkpr49ky9zq"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-failure-derive" ,rust-failure-derive-0.1)
         ("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page
      "https://rust-lang-nursery.github.io/failure/")
    (synopsis
      "Experimental error handling abstraction.")
    (description
      "Experimental error handling abstraction.")
    (license (list license:expat license:asl2.0))))

(define-public rust-which-3.1
  (package
    (name "rust-which")
    (version "3.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "which" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1j14a331qz3dj30hm4kiyxhfvwsycigbmxql0vk056i0g1qd8xal"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-failure" ,rust-failure-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/harryfei/which-rs.git")
    (synopsis
      "A Rust equivalent of Unix command \"which\". Locate installed executable in cross platforms.")
    (description
      "This package provides a Rust equivalent of Unix command \"which\".  Locate installed executable in cross platforms.")
    (license license:expat)))

(define-public rust-rustc-hash-1.1
  (package
    (name "rust-rustc-hash")
    (version "1.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rustc-hash" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1qkc5khrmv5pqi5l5ca9p5nl5hs742cagrndhbrlk3dhlrx3zm08"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/rust-lang-nursery/rustc-hash")
    (synopsis
      "speed, non-cryptographic hash used in rustc")
    (description
      "speed, non-cryptographic hash used in rustc")
    (license (list license:asl2.0 license:expat))))

(define-public rust-cexpr-0.3
  (package
    (name "rust-cexpr")
    (version "0.3.6")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cexpr" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "07fdfj4ff2974y33yixrb657riq9zl9b9h9lr0h7ridhhvxvbrgw"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-nom" ,rust-nom-4.2))))
    (home-page
      "https://github.com/jethrogb/rust-cexpr")
    (synopsis "A C expression parser and evaluator")
    (description
      "This package provides a C expression parser and evaluator")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bindgen-0.51
  (package
    (name "rust-bindgen")
    (version "0.51.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0x9gndlnwmxsihxvsc3izyyss7g8b2djn0daafshj1gcy69i7mzb"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-shlex" ,rust-shlex-0.1)
         ("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-peeking-take-while"
          ,rust-peeking-take-while-0.1)
         ("rust-clang-sys" ,rust-clang-sys-0.28)
         ("rust-cexpr" ,rust-cexpr-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-env-logger" ,rust-env-logger-0.6)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0)
         ("rust-rustc-hash" ,rust-rustc-hash-1.1)
         ("rust-bitflags" ,rust-bitflags-1)
         ("rust-regex" ,rust-regex-1.3)
         ("rust-lazy-static" ,rust-lazy-static-1.4)
         ("rust-clap" ,rust-clap-2)
         ("rust-which" ,rust-which-3.1))))
    (home-page
      "https://rust-lang.github.io/rust-bindgen/")
    (synopsis
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (description
      "Automatically generates Rust FFI bindings to C and C++ libraries.")
    (license license:bsd-3)))

(define-public rust-aom-sys-0.1
  (package
    (name "rust-aom-sys")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "aom-sys" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0ix3djcf84kk53h6fac73n7jc614745n7kbmikxwi3s73b6vzgsr"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bindgen" ,rust-bindgen-0.51)
         ("rust-metadeps" ,rust-metadeps-1.1))))
    (home-page "https://github.com/rust-av/aom-rs")
    (synopsis "FFI bindings to aom")
    (description "FFI bindings to aom")
    (license license:expat)))

(define-public rust-arc-swap-0.4
  (package
    (name "rust-arc-swap")
    (version "0.4.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "arc-swap" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1zwswfi9n7n3hiq51w1xv34572k2diazx680rrxlc9w07c9akf6p"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page "https://github.com/vorner/arc-swap")
    (synopsis "Atomically swappable Arc")
    (description "Atomically swappable Arc")
    (license (list license:asl2.0 license:expat))))

(define-public rust-signal-hook-registry-1.2
  (package
    (name "rust-signal-hook-registry")
    (version "1.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "signal-hook-registry" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0haz828bif1lbp3alx17zkcy5hwy15bbpmvks72j8iznx7npix4l"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-libc" ,rust-libc-0.2)
         ("rust-arc-swap" ,rust-arc-swap-0.4))))
    (home-page
      "https://github.com/vorner/signal-hook")
    (synopsis "Backend crate for signal-hook")
    (description "Backend crate for signal-hook")
    (license (list license:asl2.0 license:expat))))

(define-public rust-compiler-builtins-0.1
  (package
    (name "rust-compiler-builtins")
    (version "0.1.25")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "compiler_builtins" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0bn5iji0l8g2v6nfcj0z3nrh0ns2p8rrwjlq5x2q3zjyvj6w12j3"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0)
         ("rust-cc" ,rust-cc-1.0))))
    (home-page
      "https://github.com/rust-lang/compiler-builtins")
    (synopsis
      "Compiler intrinsics used by the Rust compiler. Also available for other targets
if necessary!
")
    (description
      "Compiler intrinsics used by the Rust compiler.  Also available for other targets
if necessary!
")
    (license (list license:expat license:asl2.0))))

(define-public rust-hermit-abi-0.1
  (package
    (name "rust-hermit-abi")
    (version "0.1.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "hermit-abi" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0rxvb73c6fny5xpncx8qginph8ygfhnzw9z4fyyc1yqr74a5zig2"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-compiler-builtins"
          ,rust-compiler-builtins-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-rustc-std-workspace-core"
          ,rust-rustc-std-workspace-core-1.0))))
    (home-page
      "https://github.com/hermitcore/rusty-hermit")
    (synopsis
      "hermit-abi is small interface to call functions from the unikernel RustyHermit.
It is used to build the target `x86_64-unknown-hermit`.
")
    (description
      "hermit-abi is small interface to call functions from the unikernel RustyHermit.
It is used to build the target `x86_64-unknown-hermit`.
")
    (license (list license:expat license:asl2.0))))

(define-public rust-num-cpus-1.12
  (package
    (name "rust-num-cpus")
    (version "1.12.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "num_cpus" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1riw641hsmp2vwb9wz7d26dsycrjbw3zf4nd6p18kzw5y1a3a826"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-hermit-abi" ,rust-hermit-abi-0.1)
         ("rust-libc" ,rust-libc-0.2))))
    (home-page
      "https://github.com/seanmonstar/num_cpus")
    (synopsis "Get the number of CPUs on a machine.")
    (description
      "Get the number of CPUs on a machine.")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-sync-0.1
  (package
    (name "rust-tokio-sync")
    (version "0.1.8")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokio-sync" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1vkxz0y7qf9sshfpxvn506pvxy4vza8piavd8p64y5n85cam1zpd"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures" ,rust-futures-0.1)
         ("rust-fnv" ,rust-fnv-1.0))))
    (home-page "https://tokio.rs")
    (synopsis "Synchronization utilities.
")
    (description "Synchronization utilities.
")
    (license license:expat)))

(define-public rust-smallvec-0.6
  (package
    (name "rust-smallvec")
    (version "0.6.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "smallvec" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1dl219vnfkmsfx28lm3f83lyw24zap6fdsli6rg8nnp1aa67bc7p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-serde" ,rust-serde-1.0)
         ("rust-maybe-uninit" ,rust-maybe-uninit-2.0))))
    (home-page
      "https://github.com/servo/rust-smallvec")
    (synopsis
      "'Small vector' optimization: store up to a small number of items on the stack")
    (description
      "'Small vector' optimization: store up to a small number of items on the stack")
    (license (list license:expat license:asl2.0))))

;(define-public rust-proc-macro2-1.0
;  (package
;    (name "rust-proc-macro2")
;    (version "1.0.8")
;    (source
;      (origin
;        (method url-fetch)
;        (uri (crate-uri "proc-macro2" version))
;        (file-name
;          (string-append name "-" version ".tar.gz"))
;        (sha256
;          (base32
;            "0j45p176fnw0d02dzcky9sxyr4fadiggq07skmblwspqdxy33jrs"))))
;    (build-system cargo-build-system)
;    (arguments
;      `(#:skip-build?
;        #t
;        #:cargo-inputs
;        (("rust-unicode-xid" ,rust-unicode-xid-0.2))))
;    (home-page
;      "https://github.com/alexcrichton/proc-macro2")
;    (synopsis
;      "A stable implementation of the upcoming new `proc_macro` API. Comes with an
;option, off by default, to also reimplement itself in terms of the upstream
;unstable API.
;")
;    (description
;      "This package provides a stable implementation of the upcoming new `proc_macro` API.  Comes with an
;option, off by default, to also reimplement itself in terms of the upstream
;unstable API.
;")
;    (license (list license:expat license:asl2.0))))

(define-public rust-syn-1.0
  (package
    (name "rust-syn")
    (version "1.0.14")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "syn" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1xf8g9a3yl41027g5napiwfd7r87y734lf2dqdyyzyfzv183avxg"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-unicode-xid" ,rust-unicode-xid-0.2)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-sval-derive-0.4
  (package
    (name "rust-sval-derive")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sval_derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "07s7jqsdczsg0wnydfnxyrsj8zyrjmiwl4is1dfgn8dfvyi8n2bj"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis "Custom derive for sval")
    (description "Custom derive for sval")
    (license (list license:asl2.0 license:expat))))

(define-public rust-sval-0.4
  (package
    (name "rust-sval")
    (version "0.4.7")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "sval" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1aljggx64481q4wp3wx9hxsfh2bs7d64nqsrwbb2zxcpmdnbn6yk"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-sval-derive" ,rust-sval-derive-0.4)
         ("rust-smallvec" ,rust-smallvec-0.6)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/sval-rs/sval")
    (synopsis
      "A no-std, object-safe serialization framework")
    (description
      "This package provides a no-std, object-safe serialization framework")
    (license (list license:asl2.0 license:expat))))

(define-public rust-log-0.4
  (package
    (name "rust-log")
    (version "0.4.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "log" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "170cx0xanhlhd3a249ssqydyaismcxarqi4sdw7w9ja5m5kd96hv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-sval" ,rust-sval-0.4)
         ("rust-serde" ,rust-serde-1.0))))
    (home-page "https://github.com/rust-lang/log")
    (synopsis
      "A lightweight logging facade for Rust
")
    (description
      "This package provides a lightweight logging facade for Rust
")
    (license (list license:expat license:asl2.0))))

(define-public rust-tokio-io-0.1
  (package
    (name "rust-tokio-io")
    (version "0.1.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokio-io" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0x06zyzinans1pn90g6i150lgixijdf1cg8y2gipjd09ms58dz2p"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures" ,rust-futures-0.1)
         ("rust-log" ,rust-log-0.4)
         ("rust-bytes" ,rust-bytes-0.4))))
    (home-page "https://tokio.rs")
    (synopsis
      "Core I/O primitives for asynchronous I/O in Rust.
")
    (description
      "Core I/O primitives for asynchronous I/O in Rust.
")
    (license license:expat)))

(define-public rust-tokio-executor-0.1
  (package
    (name "rust-tokio-executor")
    (version "0.1.10")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokio-executor" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0w8n78d2vixs1vghqc4wy9w0d1h6qkli51c1yzhzbns88n7inbgv"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-futures" ,rust-futures-0.1)
         ("rust-crossbeam-utils"
          ,rust-crossbeam-utils-0.7))))
    (home-page "https://github.com/tokio-rs/tokio")
    (synopsis "Future execution primitives
")
    (description "Future execution primitives
")
    (license license:expat)))

(define-public rust-tokio-reactor-0.1
  (package
    (name "rust-tokio-reactor")
    (version "0.1.12")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "tokio-reactor" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0l8klnd41q55f3ialzz0lb7s5bfwa38nh86sa9vai2xsqh75kg09"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-tokio-executor" ,rust-tokio-executor-0.1)
         ("rust-tokio-io" ,rust-tokio-io-0.1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-tokio-sync" ,rust-tokio-sync-0.1)
         ("rust-log" ,rust-log-0.4)
         ("rust-slab" ,rust-slab-0.4)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-crossbeam-utils"
          ,rust-crossbeam-utils-0.7)
         ("rust-parking-lot" ,rust-parking-lot-0.9)
         ("rust-num-cpus" ,rust-num-cpus-1.12)
         ("rust-lazy-static" ,rust-lazy-static-1.4))))
    (home-page "https://tokio.rs")
    (synopsis
      "Event loop that drives Tokio I/O resources.
")
    (description
      "Event loop that drives Tokio I/O resources.
")
    (license license:expat)))

(define-public rust-signal-hook-0.1
  (package
    (name "rust-signal-hook")
    (version "0.1.13")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "signal-hook" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0b0yh6hlb5hs5kq6adyk0bn168y1ncymxvlizlygaabad2hz7f8h"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-tokio-reactor" ,rust-tokio-reactor-0.1)
         ("rust-futures" ,rust-futures-0.1)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-mio" ,rust-mio-0.6)
         ("rust-signal-hook-registry"
          ,rust-signal-hook-registry-1.2))))
    (home-page
      "https://github.com/vorner/signal-hook")
    (synopsis "Unix signal handling")
    (description "Unix signal handling")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bitstream-io-0.8
  (package
    (name "rust-bitstream-io")
    (version "0.8.4")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "bitstream-io" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "0lyn1mb8y0bkh7c1nz7q9cixilqnwvvs1gkd0kk9jqwr7mlannrr"))))
    (build-system cargo-build-system)
    (arguments `(#:skip-build? #t))
    (home-page
      "https://github.com/tuffy/bitstream-io")
    (synopsis
      "Library for reading/writing un-aligned values from/to streams in big-endian and little-endian formats.")
    (description
      "Library for reading/writing un-aligned values from/to streams in big-endian and little-endian formats.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ivf-0.1
  (package
    (name "rust-ivf")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "ivf" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1wfjf3rilqavrhvwagzinvng9dg28wcjk3c6c6p5qmc1xy65qfh1"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-bitstream-io" ,rust-bitstream-io-0.8))))
    (home-page "https://github.com/xiph/rav1e")
    (synopsis "Simple ivf muxer")
    (description "Simple ivf muxer")
    (license license:bsd-2)))

(define-public rust-simd-helpers-0.1
  (package
    (name "rust-simd-helpers")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "simd_helpers" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "19idqicn9k4vhd04ifh2ff41wvna79zphdf2c81rlmpc7f3hz2cm"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build?
        #t
        #:cargo-inputs
        (("rust-quote" ,rust-quote-1.0))))
    (home-page
      "https://github.com/lu-zero/simd_helpers")
    (synopsis
      "Helpers to write more compact simd code")
    (description
      "Helpers to write more compact simd code")
    (license license:expat)))

(define-public rust-cargo-metadata-0.9
  (package
    (name "rust-cargo-metadata")
    (version "0.9.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo_metadata" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "00pjms89lghvizh4d55lz80hvrih9r55xv9m5wd9vcsgc163gqs6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-semver" ,rust-semver-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-serde-json" ,rust-serde-json-1.0))))
    (home-page "https://github.com/oli-obk/cargo_metadata")
    (synopsis "Structured access to Cargo metadata")
    (description "This package provides structured access to the output of
`cargo metadata`.")
    (license license:expat)))

(define-public rust-structopt-0.3
  (package
    (name "rust-structopt")
    (version "0.3.9")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "160f06f9k7b7jbm53d51w0ym2lxmxmdbkil0bnxzqml9skbvxg51"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-structopt-derive"
         ,rust-structopt-derive-0.4)
        ("rust-lazy-static" ,rust-lazy-static-1.4)
        ("rust-clap" ,rust-clap-2))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis
      "Parse command line argument by defining a struct.")
    (description
      "Parse command line argument by defining a struct.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-structopt-derive-0.4
  (package
    (name "rust-structopt-derive")
    (version "0.4.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "structopt-derive" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0r2zkrk5v3yk103rkzd082p4630lry25c2jxcd7d352v3ym68l09"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-heck" ,rust-heck-0.3)
        ("rust-proc-macro-error"
         ,rust-proc-macro-error-0.4)
        ("rust-syn" ,rust-syn-1.0)
        ("rust-quote" ,rust-quote-1.0)
        ("rust-proc-macro2" ,rust-proc-macro2-1.0))))
    (home-page "https://github.com/TeXitoi/structopt")
    (synopsis
      "Parse command line argument by defining a struct, derive crate.")
    (description
      "Parse command line argument by defining a struct, derive crate.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-pretty-env-logger-0.3
  (package
    (name "rust-pretty-env-logger")
    (version "0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "pretty_env_logger" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "0x4hyjlnvvhyk9m74iypzybm22w3dl2k8img4b956239n5vf8zki"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-chrono" ,rust-chrono-0.4)
        ("rust-log" ,rust-log-0.4)
        ("rust-env-logger" ,rust-env-logger-0.6))))
    (home-page "https://github.com/seanmonstar/pretty-env-logger")
    (synopsis "Rust logger utility")
    (description "Pretty-env-logger is a logger in Rust.  It is configured with
environment variables and can write to standard error with color-coded outputs
for different log levels.")
    ;; The user can choose which license to use.
    (license (list license:expat license:asl2.0))))

(define-public rust-cbindgen-0.12
  (package
    (name "rust-cbindgen")
    (version "0.12.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cbindgen" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "13jzbmjz1bmmfr0i80hw6ar484mgabx3hbpb2ynhk0ddqi0yr58m"))))
    (build-system cargo-build-system)
    (arguments
      `(#:skip-build? #t
        #:cargo-inputs
        (("rust-log" ,rust-log-0.4)
         ("rust-toml" ,rust-toml-0.5)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-syn" ,rust-syn-1.0)
         ("rust-quote" ,rust-quote-1.0)
         ("rust-serde-json" ,rust-serde-json-1.0)
         ("rust-proc-macro2" ,rust-proc-macro2-1.0)
         ("rust-clap" ,rust-clap-2)
         ("rust-tempfile" ,rust-tempfile-3.1))))
    (home-page "https://github.com/eqrion/cbindgen/")
    (synopsis "Tool for generating C bindings to Rust code")
    (description "This package provides a tool for generating C/C++ bindings to
Rust code.")
    (license license:mpl2.0)))

(define-public cargo-c
  (package
    (name "cargo-c")
    (version "0.5.2")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "cargo-c" version))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256
         (base32
          "1is72jm0r73pqx2g3h1n6lvrcirwd91mmajsmb3jjg4jnayfkp0w"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-cbindgen" ,rust-cbindgen-0.12)
        ("rust-pretty-env-logger"
         ,rust-pretty-env-logger-0.3)
        ("rust-structopt" ,rust-structopt-0.3)
        ("rust-log" ,rust-log-0.4)
        ("rust-toml" ,rust-toml-0.5)
        ("rust-cargo-metadata" ,rust-cargo-metadata-0.9)
        ("rust-serde" ,rust-serde-1.0)
        ("rust-serde-derive" ,rust-serde-derive-1.0)
        ("rust-regex" ,rust-regex-1.3))))
    (home-page "http://github.com/lu-zero/cargo-c")
    (synopsis "Cargo helper to build and install C-like libraries")
    (description "Cargo-c is a Cargo applet that builds and installs
C-ABI compatible dynamic and static libraries.  It produces and installs a
correct pkg-config file, a static library and a dynamic library, and a C header
to be used by any C (and C-compatible) software.")
    (license license:expat)))

(define-public rav1e
  (package
    (name "rav1e")
    (version "0.3.0")
    (source
      (origin
        (method url-fetch)
        (uri (crate-uri "rav1e" version))
        (file-name
          (string-append name "-" version ".tar.gz"))
        (sha256
          (base32
            "1bsmj8kqzs5pf8dl98rsl6a67cljj1gkj3b5hmd8hn8wdy4ya173"))))
    (build-system cargo-build-system)
    (arguments
      `(#:cargo-inputs
        (("rust-simd-helpers" ,rust-simd-helpers-0.1)
         ("rust-ivf" ,rust-ivf-0.1)
         ("rust-cfg-if" ,rust-cfg-if-0.1)
         ("rust-signal-hook" ,rust-signal-hook-0.1)
         ("rust-aom-sys" ,rust-aom-sys-0.1)
         ("rust-paste" ,rust-paste-0.1)
         ("rust-nasm-rs" ,rust-nasm-rs-0.1)
         ("rust-arbitrary" ,rust-arbitrary-0.2)
         ("rust-better-panic" ,rust-better-panic-0.2)
         ("rust-noop-proc-macro"
          ,rust-noop-proc-macro-0.2)
         ("rust-rand-chacha" ,rust-rand-chacha-0.2)
         ("rust-num-traits" ,rust-num-traits-0.2)
         ("rust-err-derive" ,rust-err-derive-0.2)
         ("rust-interpolate-name"
          ,rust-interpolate-name-0.2)
         ("rust-rustc-version" ,rust-rustc-version-0.2)
         ("rust-scan-fmt" ,rust-scan-fmt-0.2)
         ("rust-libc" ,rust-libc-0.2)
         ("rust-image" ,rust-image-0.22)
         ("rust-arg-enum-proc-macro"
          ,rust-arg-enum-proc-macro-0.3)
         ("rust-num-derive" ,rust-num-derive-0.3)
         ("rust-dav1d-sys" ,rust-dav1d-sys-0.3)
         ("rust-backtrace" ,rust-backtrace-0.3)
         ("rust-log" ,rust-log-0.4)
         ("rust-y4m" ,rust-y4m-0.5)
         ("rust-arrayvec" ,rust-arrayvec-0.5)
         ("rust-toml" ,rust-toml-0.5)
         ("rust-fern" ,rust-fern-0.5)
         ("rust-rust-hawktracer"
          ,rust-rust-hawktracer-0.7)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-itertools" ,rust-itertools-0.8)
         ("rust-bitstream-io" ,rust-bitstream-io-0.8)
         ("rust-console" ,rust-console-0.9)
         ("rust-serde" ,rust-serde-1.0)
         ("rust-cc" ,rust-cc-1.0)
         ("rust-rayon" ,rust-rayon-1.3)
         ("rust-byteorder" ,rust-byteorder-1.3)
         ("rust-clap" ,rust-clap-2)
         ("rust-vergen" ,rust-vergen-3.0))
        #:cargo-development-inputs
        (("rust-rand-chacha" ,rust-rand-chacha-0.2)
         ("rust-interpolate-name"
          ,rust-interpolate-name-0.2)
         ("rust-criterion" ,rust-criterion-0.3)
         ("rust-pretty-assertions"
          ,rust-pretty-assertions-0.6)
         ("rust-rand" ,rust-rand-0.7)
         ("rust-semver" ,rust-semver-0.9))
        #:phases
        (modify-phases %standard-phases
          (replace 'build
            (lambda* (#:key outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out")))
                (invoke "cargo" "cinstall" "--release"
                        (string-append "--prefix=" out))))))))
    (native-inputs
     `(("cargo-c" ,cargo-c)))
    (inputs
     `(("nasm" ,nasm)))
    (home-page "https://github.com/xiph/rav1e/")
    (synopsis "AV1 encoder in Rust")
    (description "Rav1e is an AV1 encoder written in Rust.")
    (license license:bsd-2)))
