class Cil < Formula
  desc "C Intermediate Language"
  homepage "https://cil-project.github.io/cil/"

  head "https://github.com/cil-project/cil.git", :branch => "develop"

  depends_on "ocaml"
  depends_on "ocaml-findlib"
  depends_on "ocaml-num"
  depends_on "ocamlbuild"

  def install
    ENV["OCAMLPARAM"] = "safe-string=0,_"

    ENV["OCAMLFIND_DESTDIR"] = lib/"ocaml"
    (lib/"ocaml").mkpath
    cp Formula["ocaml"].opt_lib/"ocaml/Makefile.config", lib/"ocaml"

    # install in #{lib}/ocaml not #{HOMEBREW_PREFIX}/lib/ocaml
    inreplace lib/"ocaml/Makefile.config", /^PREFIX=#{HOMEBREW_PREFIX}$/,
                                           "PREFIX=#{prefix}"

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"

    rm lib/"ocaml/Makefile.config" # avoid conflict with ocaml
  end

  test do
    system "cilly --version"
  end
end
