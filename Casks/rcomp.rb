cask "rcomp" do
  os macos: "universal.dmg", linux: "amd64.AppImage"

  version "0.2.0"

  on_macos do
    sha256 "748b98a0e49bbf04b0212d65f3f6b9815796cdd103ee6f1c015d96803a996245"
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
    sha256 x86_64_linux: "d326f837abcb88d4abf9b58a76048ab85656cab63dc8cb2e7ea0481c46621817"
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
