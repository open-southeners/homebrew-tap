cask "file-assoc-manager" do
  version "1.0"
  sha256 "42105baca8628ca6081df32831607ec5ad03275225894d351b0ffebfe4bf9555"

  url "https://github.com/open-southeners/fileassocmanager/releases/download/#{version}/FileAssocManager.app.zip"
  name "File Association Manager"
  desc "Manage default applications for file types"
  homepage "https://github.com/open-southeners/fileassocmanager"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "FileAssocManager.app"

  zap trash: [
    "~/Library/Application Support/com.opensoutheners.FileAssocManager",
    "~/Library/Caches/com.opensoutheners.FileAssocManager",
    "~/Library/Preferences/com.opensoutheners.FileAssocManager.plist",
  ]
end
