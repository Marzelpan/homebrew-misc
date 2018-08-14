class Ccfinderx < Formula
  desc "CCFinderX clone detector"
  homepage "http://www.ccfinder.net/"
  head "https://github.com/Marzelpan/ccfinderx.git"

  depends_on "icu4c@57_1"
  depends_on "boost"
  depends_on "python@2"
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "libtool" => :build

  def install
    system "glibtoolize"
    system "aclocal", "-I", "m4", "--install"
    system "autoconf"
    system "automake", "--foreign", "--add-missing"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ccfinderx`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
