cask "rcomp" do
  version "0.2.0"
  sha256 "748b98a0e49bbf04b0212d65f3f6b9815796cdd103ee6f1c015d96803a996245"

  url "https://github.com/open-southeners/rcomp/releases/download/v#{version}/Rcomp_#{version}_universal.dmg"
  name "RComp Desktop"
  desc "Desktop app for compressing and extracting archives"
  homepage "https://github.com/open-southeners/rcomp"

  depends_on :macos

  app "Rcomp.app"

  zap trash: [
    "~/Library/Application Support/com.opensoutheners.rcomp",
    "~/Library/Caches/com.opensoutheners.rcomp",
    "~/Library/Preferences/com.opensoutheners.rcomp.plist",
  ]
end
