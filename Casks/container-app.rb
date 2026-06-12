cask "container-app" do
  version "1.2.0"
  sha256 "840f14e7aa6f2c077137ef78cf94dda4ba1ffc926302ca8da30a9ecd77f77a26"

  url "https://github.com/open-southeners/ContainerApp/releases/download/v#{version}/ContainerApp-#{version}.dmg"
  name "Container App"
  desc "Native macOS interface for Apple's container CLI"
  homepage "https://github.com/open-southeners/ContainerApp"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"
  depends_on formula: "container"

  app "Container.app"

  zap trash: [
    "~/Library/Application Support/com.opensoutheners.ContainerApp",
    "~/Library/Caches/com.opensoutheners.ContainerApp",
    "~/Library/Preferences/com.opensoutheners.ContainerApp.plist",
  ]
end
