class Lambdary < Formula
  desc "Local development server for AWS Lambda functions"
  homepage "https://github.com/open-southeners/lambdary"
  license :cannot_represent

  on_macos do
    on_intel do
      url "https://github.com/open-southeners/lambdary/releases/download/1.0.0/lambdary_1.0.0_darwin_amd64.tar.gz"
      sha256 "aecbef0e3c55241f425cb4a0b5b0b1100f68aa5f9d416fa5a55a3266fe8125cd"
    end

    on_arm do
      url "https://github.com/open-southeners/lambdary/releases/download/1.0.0/lambdary_1.0.0_darwin_arm64.tar.gz"
      sha256 "ae54798530f2d76bfa291aca7780c305505b31ef508910802190816cd6e70cf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/open-southeners/lambdary/releases/download/1.0.0/lambdary_1.0.0_linux_amd64.tar.gz"
      sha256 "dca1ff7a7530fdedd627900e04b93a40de4bb6329ac29cdf84821fa86598c40d"
    end

    on_arm do
      url "https://github.com/open-southeners/lambdary/releases/download/1.0.0/lambdary_1.0.0_linux_arm64.tar.gz"
      sha256 "db289754df99cd58ea9c06ebbe5cdbca90e0d21e582d0472ac5b1de234a66cb8"
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
