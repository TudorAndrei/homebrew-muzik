# Homebrew tap for muzik

`Formula/muzik.rb` installs the GitHub Release build of
[`muzik`](https://github.com/TudorAndrei/muzik) on macOS arm64, plus the `ffmpeg`
and `yt-dlp` binaries.

## Install

```sh
brew install TudorAndrei/muzik/muzik
```

Then, once, for Bandcamp downloads:

```sh
"$(brew --prefix)/opt/muzik/libexec/bin/playwright" install chromium
```

## Update for a new release (maintainer)

For each new tag, edit `Formula/muzik.rb` in the tap:

1. Change `url` to the new `muzik-<version>.tar.gz` release asset.
2. Change `sha256` to that asset's hash:
   `curl -sL <asset-url> | shasum -a 256`.
3. Commit and push. Users get the update with `brew upgrade muzik`.

## Notes and caveats

- **Dependencies come from PyPI at install time.** `pip` resolves the Python
  dependencies (including the `dearpygui` cp314 wheel) while `brew install` runs.
  This reaches the network during the build step, so the formula is not
  reproducible and would not pass a `homebrew-core` audit. That is acceptable for a
  personal tap. A fully vendored, audit-clean formula becomes practical only if
  `muzik` is published to PyPI.
- **Binaries.** `ffmpeg` (with `ffprobe`) and `yt-dlp` are Homebrew dependencies,
  so `brew` installs them. The user does not add them to `PATH` by hand.
- **Chromium is not automatic.** Playwright's browser is a one-time manual install,
  as shown above.
