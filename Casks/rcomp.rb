cask "rcomp" do
  os macos: "macos-universal.dmg", linux: "linux-x86_64.AppImage"

  version "0.4.0"

  on_macos do
    sha256 "db03176756a4766faa9cc593be47349604ee5f3d14bf2b49a61a9020c24c8432"
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
    sha256 x86_64_linux: "1c3e79cb966fb8c2da10aed953d8cfdfded13e50e522715037a7887ef6f3de18"
  end
  on_linux do
    depends_on arch: :x86_64

    app_image "rcomp-desktop_#{version}_linux-x86_64.AppImage", target: "Rcomp.AppImage"
  end

  url "https://github.com/open-southeners/rcomp/releases/download/v#{version}/rcomp-desktop_#{version}_#{os}"
  name "RComp Desktop"
  desc "Desktop app for compressing and extracting archives"
  homepage "https://github.com/open-southeners/rcomp"

  livecheck do
    url :homepage
    strategy :github_latest
  end
end
