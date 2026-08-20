# Homebrew tap for [Flash](https://github.com/lsheva/flash)

Unsigned Apple Silicon build. Official Homebrew Cask will not take it until
the app is Developer ID–signed and notarized.

```bash
brew tap lsheva/flash
brew install --cask flash-viewer
```

`flash` is already a core formula (an SD-card tool), so this cask is named
`flash-viewer`. It installs `Flash.app` into `/Applications`.
