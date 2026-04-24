class Weatherlight < Formula
  desc "Private, automatic, searchable memory for your bookmarks"
  homepage "https://weatherlight.app"
  url "https://github.com/NSMyself/homebrew-weatherlight/releases/download/v0.1.0-alpha/weatherlight-0.1.0-alpha-arm64.tar.gz"
  sha256 "PLACEHOLDER"
  license :cannot_represent
  version "0.1.0-alpha"

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
