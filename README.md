# Homebrew tap for muzik

`Casks/muzik.rb` installs the [muzik](https://github.com/TudorAndrei/muzik)
desktop app, `Muzik.app`, on Apple silicon Macs, with `ffmpeg` and `yt-dlp`.

```sh
brew install --cask tudorandrei/muzik/muzik
```

The command-line program comes from mise:

```toml
[tools]
"github:TudorAndrei/muzik" = { version = "latest", matching = "muzik-cli" }
```

## Update for a new release

1. Copy `packaging/homebrew/Casks/muzik.rb` from the muzik repository, or edit
   `Casks/muzik.rb` here.
2. Set `version` to the release version without the `v`.
3. Set `sha256` to the value in `Muzik-v<version>-aarch64-apple-darwin.zip.sha256`.
4. Run `brew audit --cask --strict tudorandrei/muzik/muzik`, then commit and push.
