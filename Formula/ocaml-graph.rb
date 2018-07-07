class OcamlGraph < Formula
  desc "A generic graph library for OCaml"
  homepage "http://ocamlgraph.lri.fr/"
  url "http://ocamlgraph.lri.fr/download/ocamlgraph-1.8.8.tar.gz"
  sha256 "d9eabefb73cad7bc59b3870f832cd0154f8b60feca89ef087f06e59cb9092f55"

  depends_on "ocaml-findlib" => :build
  depends_on "ocaml"

  def install
    ENV["OCAMLFIND_DESTDIR"] = lib/"ocaml"

    (lib/"ocaml").mkpath
    cp Formula["ocaml"].opt_lib/"ocaml/Makefile.config", lib/"ocaml"

    # install in #{lib}/ocaml not #{HOMEBREW_PREFIX}/lib/ocaml
    inreplace lib/"ocaml/Makefile.config", /^PREFIX=#{HOMEBREW_PREFIX}$/,
                                           "PREFIX=#{prefix}"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install-findlib"

    rm lib/"ocaml/Makefile.config" # avoid conflict with ocaml
  end
end
