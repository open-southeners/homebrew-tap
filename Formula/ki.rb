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
      sha256 "6b9a6873c9faa3ad8decbc1b0a86606ab22dafcd6336a89f6700e611d0258d5f"
    end

    on_arm do
      url "https://github.com/open-southeners/ki/releases/download/v1.1.0/ki_1.1.0_darwin_arm64.tar.gz"
      sha256 "13b8cc95a31427a8e71eb8f2fafff44a8511aabd07906140a6f282b6dbef979e"
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
