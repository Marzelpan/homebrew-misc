class Dude < Formula
  desc "A text-based, language-independent code duplication (code clones) detector"
  homepage "https://wettel.github.io/dude.html"
  url "https://wettel.github.io/download/dude.jar"
  sha256 "0ec84c1a5c848a58826b26bc162df9380eb7efa3150763ef7e0a9bb26d7faa6b"
  version "1.0"

  depends_on :java

  def install
    prefix.install "dude.jar"

    (bin/"dude").write <<~EOS
      #!/bin/sh
      exec java -jar #{prefix}/dude.jar "$@"
    EOS

  end
end
