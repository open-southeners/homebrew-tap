class Rcomp < Formula
  desc "Compression and archive tool supporting multiple formats"
  homepage "https://github.com/open-southeners/rcomp"
  url "https://github.com/open-southeners/rcomp/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7457fb2d93549d533e7e8d0747d31cb27e5ba7420bd7a35ac3b6a22ba74f461c"
  license any_of: ["MIT", "Apache-2.0"]

  livecheck do
    url :homepage
    strategy :github_latest
  end

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
    )

    (man1/"rcomp.1").write shell_output("#{bin}/rcomp man")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rcomp --version")
    assert_match "Usage", shell_output("#{bin}/rcomp --help")
  end
end
