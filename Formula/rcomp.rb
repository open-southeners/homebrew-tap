class Rcomp < Formula
  desc "Compression and archive tool supporting multiple formats"
  homepage "https://github.com/open-southeners/rcomp"
  url "https://github.com/open-southeners/rcomp/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "362a9be01f727accbbb9d49cac01bcc7531bd5be15ea59708132b63a20b4f07c"
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
