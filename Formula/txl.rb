class Txl < Formula
  desc "Experimental rule-based structural programming language"
  homepage "http://txl.ca/"

  version "10.6e"

  if MacOS.prefer_64_bit?
    url "http://www.txl.ca/ndownload/4145-txl10.6e.macosx64.tar.gz"
    sha256 "cf7ffc38c6e492a0cdb193ffd0a22404ab1b12dae60581805162bb066feab256"
  else
    url "http://www.txl.ca/ndownload/4255-txl10.6e.macosx32.tar.gz"
    # sha256 ""
  end

  def caveats; <<~EOS
    We agreed to the TXL terms and conditions for you.
    If this is unacceptable you should uninstall.
    EOS
  end

  bottle :unneeded

  def install
    libexec.install Dir["*"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
    man1.install Dir["#{libexec}/man/man1/*.1"]
  end

  test do
    assert_equal "TXL v10.6e (9.5.17) (c) 1988-2017 Queen's University at Kingston\n", shell_output("#{bin}/txl 2>&1 | grep #{version}")
  end
end