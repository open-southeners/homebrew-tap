cask "gltfquicklook" do
  version "1.0"
  sha256 "6902746b1f80148e2763b2bd455987cf0a4478ae666a91f9bd297467d407fffb"

  url "https://github.com/open-southeners/GLTFQuickLook/releases/download/#{version}/GLTFQuickLook.dmg"
  name "GLTFQuickLook"
  desc "Quick Look previews and thumbnails for glTF and GLB files"
  homepage "https://github.com/open-southeners/GLTFQuickLook"

  depends_on macos: :monterey

  app "GLTFQuickLook.app"

  uninstall quit: "jp.0spec.GLTFQuickLook"

  zap trash: [
    "~/Library/Application Support/jp.0spec.GLTFQuickLook",
    "~/Library/Caches/jp.0spec.GLTFQuickLook",
    "~/Library/Preferences/jp.0spec.GLTFQuickLook.plist",
  ]

  caveats <<~EOS
    Launch GLTFQuickLook once after installation so macOS registers the
    embedded Quick Look extensions.
  EOS
end
