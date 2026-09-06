class Lambdary < Formula
  desc "Local development server for AWS Lambda functions"
  homepage "https://github.com/open-southeners/lambdary"
  license :cannot_represent

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_intel do
      url "https://github.com/open-southeners/lambdary/releases/download/1.1.0/lambdary_1.1.0_darwin_amd64.tar.gz"
      sha256 "92c08a41b1f1ea7dcc662da897dd60b53f1db9d860dd0eda330b5c37c5d81a5e"
    end

    on_arm do
      url "https://github.com/open-southeners/lambdary/releases/download/1.1.0/lambdary_1.1.0_darwin_arm64.tar.gz"
      sha256 "424d257bb27b1497d3103b15b17b476dc9495669865204fa9ca2eaf4f9a4722b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/open-southeners/lambdary/releases/download/1.1.0/lambdary_1.1.0_linux_amd64.tar.gz"
      sha256 "082cb50bd3e857b599be7a17e356eadaeac9c123ee585f85dc4e18ceca23c99a"
    end

    on_arm do
      url "https://github.com/open-southeners/lambdary/releases/download/1.1.0/lambdary_1.1.0_linux_arm64.tar.gz"
      sha256 "4d6133b02a85adc5e3d68aaef9697436190d25a1cb9597a1388ab0c7cba52548"
    end
  end

  def install
    bin.install "lambdary"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lambdary --version")
    assert_match "Usage", shell_output("#{bin}/lambdary --help")
  end
end
