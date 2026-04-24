# Weatherlight Alpha

Thanks for testing Weatherlight. This is a pre-release — expect rough edges and
please report anything that feels off.

## Requirements

- macOS Sonoma (14.0) or newer
- Apple Silicon (M1/M2/M3/M4) — Intel Macs are not supported yet
- ~5 GB free disk space if you plan to use the built-in local LLM

## Install

```bash
brew tap NSMyself/weatherlight
brew install weatherlight
```

The binary is codesigned with an Apple Developer ID and notarized, so no
Gatekeeper workaround is required.

## First run

```bash
weatherlight setup
```

This detects any local LLM servers (LM Studio, Ollama) you're running and lets
you pick your inference provider. Options:

- **Built-in local model** (Qwen3-8B-3bit via MLX) — downloads ~4 GB on first
  use. Everything stays on your Mac.
- **Local server** (LM Studio / Ollama / llama.cpp) — use your own model via
  an OpenAI-compatible endpoint.
- **Cloud BYOK** — Anthropic, OpenAI, Gemini, or OpenRouter. Bring your own
  API key.

You can re-run `weatherlight setup` any time to switch providers.

## Daily use

```bash
# Save a page
weatherlight add <url>

# Search your library (semantic)
weatherlight search "query"

# Ask a question grounded in your saved content
weatherlight ask "what did I save about topic X?"

# Smart auto-routing (picks search or ask)
weatherlight query "your question here"
```

## Import existing bookmarks

Export bookmarks from Chrome (Bookmarks Manager → ⋮ → Export bookmarks) or
another browser that produces a Netscape-format `.html` file, then:

```bash
weatherlight import bookmarks.html
weatherlight extract     # fetch + index imported pages
weatherlight organise    # auto-categorise into folders
```

Imports are idempotent; running `import` again on the same file is a no-op for
bookmarks already in your library.

## Where your data lives

```
~/Library/Application Support/Weatherlight/
  weatherlight.db          # SQLite database (bookmarks, chunks, embeddings)
  config.json              # your setup choices
  Models/                  # downloaded LLM weights (if using built-in MLX)
```

No data leaves your Mac unless you explicitly chose a cloud BYOK provider.

## Reset everything

```bash
rm -rf ~/Library/Application\ Support/Weatherlight/
brew reinstall weatherlight
```

## Known limitations (alpha)

- CLI only — macOS app is next on the roadmap
- No browser extension in this channel yet — use `weatherlight add <url>` manually
- YouTube transcript capture not implemented
- Apple Silicon only

## Feedback

File issues or send feedback to: TBD.
