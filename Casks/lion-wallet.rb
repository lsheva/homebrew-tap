cask "lion-wallet" do
  version "0.1.6"
  sha256 "b385b3572143efa39802b75703e98826221f359c1d786aefca971a1013773d98"

  url "https://github.com/lsheva/lion-wallet/releases/download/v#{version}/LionWallet-#{version}.zip"
  name "Lion Wallet"
  desc "EVM wallet with native Keychain integration"
  homepage "https://github.com/lsheva/lion-wallet"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "LionWallet.app"

  # Not notarized. Strip Gatekeeper quarantine so a freshly downloaded
  # copy can launch; this is a local unsigned build, not an identified developer.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LionWallet.app"]
  end

  caveats <<~EOS
    Lion Wallet is ad-hoc signed (not notarized). Homebrew removes the
    quarantine flag after install. If macOS still blocks it, go to
    System Settings → Privacy & Security and click Open Anyway.

    Then enable the extension in Safari → Settings → Extensions, and
    allow unsigned extensions in Safari's Developer settings (this
    setting resets each time Safari relaunches).
  EOS
end
