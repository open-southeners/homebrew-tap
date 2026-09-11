cask "rcomp" do
  os macos: "universal.dmg", linux: "amd64.AppImage"

  version "0.3.2"

  on_macos do
    sha256 "7fe9050a8b41bb20de93a77839952bb7f9ad03ab2d4ffa622095aa17d9cf59c4"
  end
  on_macos do
    app "Rcomp.app"

    zap trash: [
      "~/Library/Application Support/com.opensoutheners.rcomp",
      "~/Library/Caches/com.opensoutheners.rcomp",
      "~/Library/Preferences/com.opensoutheners.rcomp.plist",
    ]
  end
  on_linux do
    sha256 x86_64_linux: "3bd58dafd978c23b3a5442f8f570dc40bc239278b9481324756d851c9c3f779b"
  end
  on_linux do
    depends_on arch: :x86_64

    app_image "Rcomp_#{version}_amd64.AppImage", target: "Rcomp.AppImage"
  end

  url "https://github.com/open-southeners/rcomp/releases/download/v#{version}/Rcomp_#{version}_#{os}"
  name "RComp Desktop"
  desc "Desktop app for compressing and extracting archives"
  homepage "https://github.com/open-southeners/rcomp"

  livecheck do
    url :homepage
    strategy :github_latest
  end
end
