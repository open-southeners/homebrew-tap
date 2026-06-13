cask "container-app" do
  version "1.3.0"
  sha256 "d893b365be5b1ad5d5a4a2eafe0c46f072e9cea10cc880d09e0a06d7cbe1d171"

  url "https://github.com/open-southeners/ContainerApp/releases/download/#{version}/ContainerApp-#{version}.zip"
  name "Container App"
  desc "Native interface for Apple's container CLI"
  homepage "https://github.com/open-southeners/ContainerApp"

  depends_on arch: :arm64
  depends_on macos: :sequoia
  depends_on formula: "container"

  app "ContainerApp.app"

  zap trash: [
    "~/Library/Application Support/com.opensoutheners.ContainerApp",
    "~/Library/Caches/com.opensoutheners.ContainerApp",
    "~/Library/Preferences/com.opensoutheners.ContainerApp.plist",
  ]
end
