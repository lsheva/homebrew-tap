cask "flash-viewer" do
  version "0.1.0"
  sha256 "23191dc1b98b8c114bf9bec48d2ea76fb608d93ebe35b2cf0a72adb2ab5a1ea4"

  url "https://github.com/lsheva/flash/releases/download/v#{version}/Flash-#{version}.zip"
  name "Flash"
  desc "Small SwiftUI photo viewer"
  homepage "https://github.com/lsheva/flash"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Flash.app"

  # Not notarized. Strip Gatekeeper quarantine so a freshly downloaded
  # copy can launch; this is a local unsigned build, not an identified developer.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Flash.app"]
  end

  zap trash: []

  caveats <<~EOS
    Flash is ad-hoc signed (not notarized). Homebrew removes the quarantine
    flag after install. If macOS still blocks it, go to System Settings →
    Privacy & Security and click Open Anyway.
  EOS
end
