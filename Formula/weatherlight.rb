class Weatherlight < Formula
  desc "Private, automatic, searchable memory for your bookmarks"
  homepage "https://weatherlight.app"
  url "https://github.com/NSMyself/homebrew-weatherlight/releases/download/v0.13.0/weatherlight-0.13.0-arm64.zip"
  sha256 "7aa9babdbe3523510fb5b7a4b27847a74d5fddeb648e3d95549186c565fe611c"
  license :cannot_represent
  version "0.13.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "weatherlight"
    bin.install "mlx.metallib"
    bin.install "weatherlight_WeatherlightCore.bundle"
  end

  def caveats
    <<~EOS
      Weatherlight stores data in:
        ~/Library/Application Support/Weatherlight/

      First LLM command auto-triggers: weatherlight setup
      The Qwen3 model (~4 GB) downloads on first use if you pick the
      built-in local model during setup.

      To get started:
        weatherlight setup
        weatherlight add <url>
        weatherlight search "<query>"
        weatherlight ask "<question>"
    EOS
  end

  test do
    assert_match "weatherlight", shell_output("#{bin}/weatherlight --help")
  end
end
