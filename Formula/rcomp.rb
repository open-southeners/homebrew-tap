class Rcomp < Formula
  desc "Compression and archive tool supporting multiple formats"
  homepage "https://github.com/open-southeners/rcomp"
  url "https://github.com/open-southeners/rcomp/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "db12e2ca6535978225532d2c4b4e5f3eccfac7d754db566efb96f7d704cb9a64"
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

    (man1/"rcomp.1").write Utils.safe_popen_read(bin/"rcomp", "man")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rcomp --version")
    assert_match "Usage", shell_output("#{bin}/rcomp --help")
  end
end
