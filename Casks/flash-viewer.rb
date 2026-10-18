cask "flash-viewer" do
  version "0.1.2"
  sha256 "040ebfe6f0ab4d5eb052d9db0e420940f666807dfdd3357bd31b5d6b95c1ef99"

  url "https://github.com/lsheva/flash/releases/download/v#{version}/Flash-#{version}.zip"
  name "Flash"
  desc "Small SwiftUI photo viewer"
  homepage "https://github.com/lsheva/flash"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Flash.app"

  # Not notarized. Strip Gatekeeper quarantine so a freshly downloaded
  # copy can launch; this is a local unsigned build, not an identified developer.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Flash.app"]
  end

  caveats <<~EOS
    Flash is ad-hoc signed (not notarized). Homebrew removes the quarantine
    flag after install. If macOS still blocks it, go to System Settings →
    Privacy & Security and click Open Anyway.
  EOS
end
