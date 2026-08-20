# lsheva tap

Personal Homebrew tap. Not the official Homebrew catalogues — unsigned or
personal builds live here.

```bash
brew tap lsheva/tap
brew install --cask flash-viewer
```

| Cask | Installs | Source |
|---|---|---|
| `flash-viewer` | `Flash.app` | [lsheva/flash](https://github.com/lsheva/flash) |

`flash` is already a Homebrew core formula (an SD-card tool), so the photo
viewer cask is named `flash-viewer`.

Add more recipes as `Casks/<name>.rb` or `Formula/<name>.rb`. Each project
keeps its own repo; this tap only stores the install recipe and a release
checksum.
