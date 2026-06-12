class Rcomp < Formula
  desc "Compression and archive tool supporting multiple formats"
  homepage "https://github.com/open-southeners/rcomp"
  url "https://github.com/open-southeners/rcomp/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a6336a4d3e6e6a37c40c06fa9d2c9b04507663c13823e3cb29d843dd8f85e88a"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install",
           "--locked",
           "--no-default-features",
           "--root", prefix,
           "--path", "crates/rcomp"

    generate_completions_from_executable(
      bin/"rcomp",
      "completions",
      shells: [:bash, :zsh, :fish]
    )

    (man1/"rcomp.1").write shell_output("#{bin}/rcomp man")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rcomp --version")
    assert_match "Usage", shell_output("#{bin}/rcomp --help")
  end
end
