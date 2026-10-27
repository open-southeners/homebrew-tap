class Ki < Formula
  desc "Command-line client for Kiarga and the ki server agent"
  homepage "https://github.com/open-southeners/ki"
  license "Apache-2.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/open-southeners/ki/releases/download/v1.1.0/ki_1.1.0_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end

    on_arm do
      url "https://github.com/open-southeners/ki/releases/download/v1.1.0/ki_1.1.0_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "ki"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ki version")
    assert_match "agent", shell_output("#{bin}/ki --help")
  end
end
