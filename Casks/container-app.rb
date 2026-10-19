cask "container-app" do
  version "1.4.0"
  sha256 "91c6e7ee6dd3c7bfe9d516a42c6f8fd662d3e49106ca42a8f2316a869938e56c"

  url "https://github.com/open-southeners/ContainerApp/releases/download/#{version}/ContainerApp-#{version}.zip"
  name "Container App"
  desc "Native interface for Apple's container CLI"
  homepage "https://github.com/open-southeners/ContainerApp"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "container"
  depends_on formula: "container-compose"
  depends_on macos: :tahoe

  app "ContainerApp.app"

  zap trash: [
    "~/Library/Application Support/com.opensoutheners.ContainerApp",
    "~/Library/Caches/com.opensoutheners.ContainerApp",
    "~/Library/Preferences/com.opensoutheners.ContainerApp.plist",
  ]
end
