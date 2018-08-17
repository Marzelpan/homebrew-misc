class Nicad < Formula
  desc "NiCad4 Clone Detector"
  homepage "https://www.txl.ca/nicaddownload.html"
  url "https://www.txl.ca/ndownload/22872-NiCad-4.0.tar.gz"
  sha256 "37ef4db8cfd84b36b3ab6db8d3a0395f83d4421711eefffecf6cd773116a6f29"

  depends_on "txl"

  def install
    system "make"
    inreplace "nicad4", "LIB=.", "LIB=#{libexec}"
    inreplace "nicad4cross", "LIB=.", "LIB=#{libexec}"
    libexec.install Dir["*"]
    bin.write_exec_script ["#{libexec}/nicad4", "#{libexec}/nicad4cross"]
  end

  def caveats; <<~EOS
    We agreed to the NiCad terms and conditions for you.
    If this is unacceptable you should uninstall.
    EOS
  end


  test do
    assert_equal "NiCad Clone Detector v4.0 (15.2.16)\n", shell_output("#{bin}/nicad4 2>&1 | grep #{version}")
  end
end
