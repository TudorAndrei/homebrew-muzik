# Homebrew formula for muzik. Install with:
#   brew install TudorAndrei/muzik/muzik
#
# The formula builds muzik from the GitHub Release source archive into a private
# libexec virtual environment. pip fetches the Python dependencies from PyPI at
# install time (dearpygui ships as a cp314 wheel there). ffmpeg, ffprobe, and
# yt-dlp come from Homebrew. Bandcamp still needs a one-time Chromium install:
#   "#{libexec}/bin/playwright" install chromium
class Muzik < Formula
  include Language::Python::Virtualenv

  desc "Download, split, tag, and organize music from Soulseek, YouTube, and Bandcamp"
  homepage "https://github.com/TudorAndrei/muzik"
  url "https://github.com/TudorAndrei/muzik/releases/download/v1.1.0/muzik-1.1.0.tar.gz"
  sha256 "c5a6b11032fc0719b3d8cb988260e242657ccbd2562dd98dbbb37b0029cec5d0"
  license :cannot_represent # proprietary: all rights reserved

  depends_on "ffmpeg"
  depends_on "python@3.14"
  depends_on "yt-dlp"

  def install
    venv = virtualenv_create(libexec, "python3.14")
    system venv.root/"bin/pip", "install", "--verbose", buildpath
    bin.install_symlink libexec/"bin/muzik"
  end

  test do
    assert_match "muzik", shell_output("#{bin}/muzik --help")
  end
end
