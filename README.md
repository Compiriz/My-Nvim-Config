# Just My Nvim Config :)

A modern, fully Lua-based [Neovim](https://neovim.io) configuration built around
[lazy.nvim](https://github.com/folke/lazy.nvim). It covers LSP, autocompletion,
formatting, linting, debugging, fuzzy finding, a file explorer, and a bunch of
quality-of-life plugins — all lazy-loaded where it helps startup.

> **Leader key:** `Space` (``<Space>``). `maplocalleader` is `\`.
> **Keybindings & commands:** see [SHORTCUTS.md](./SHORTCUTS.md).
> **Plugin docs:** local copies (pinned to `lazy-lock.json`) in [docs/plugins/](./docs/plugins/).

---

## Requirements

| Tool | Notes |
| --- | --- |
| **Neovim** | **0.12+** (required by nvim-treesitter's new API, mason-lspconfig v2, nvim-lspconfig 2.x) |
| **Git** | Used by lazy.nvim to clone plugins and by Mason to fetch tools |
| **C compiler** | Needed to build Treesitter parsers and `telescope-fzf-native` |
| **ripgrep** | Powers Telescope `live_grep` (`:MasonInstall ripgrep` or your package manager) |

Everything else (LSP servers, linters, formatters, the debugger) is installed
through [Mason](#language-support) with `:MasonInstall <tool>`.

---

## Installation

```sh
# 1. Back up any existing config (if you have one)
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null

# 2. Clone this repo as your Neovim config
git clone <this-repo-url> ~/.config/nvim

# 3. Open Neovim
nvim
```

On first launch, lazy.nvim bootstraps itself (if not already present) and
installs every plugin automatically. Close and reopen `nvim` once it finishes.

Then install the language tooling you need via Mason (see
[Language Support](#language-support)).

### Update everything

```sh
:Lazy sync        # install/update plugins to match the spec
:Lazy update      # check for outdated plugins
:TSUpdate         # update Treesitter parsers
:MasonUpdate      # update Mason registries
```

---

## Project Structure

```text
nvim/
├── init.lua                     # Entry point: loads config modules
├── .luarc.json                  # Lua LSP server settings (for editing this config)
├── lazy-lock.json               # Pinned plugin versions (managed by lazy.nvim)
├── SHORTCUTS.md                 # All keybindings & commands
├── docs/plugins/                # Plugin READMEs, pinned to lazy-lock.json
└── lua/
    ├── config/
    │   ├── options.lua          # vim.g / vim.opt / diagnostics settings
    │   ├── lazy.lua             # lazy.nvim bootstrap + setup
    │   └── keymap.lua           # Global (non-plugin) keymaps
    └── plugins/                 # One spec file per plugin (imported by lazy.nvim)
        ├── alpha.lua            # Startup screen
        ├── autopairs.nvim.lua   # Automatic bracket/quote pairs
        ├── bufferline.nvim.lua  # Tab-line buffer UI
        ├── completions.lua      # nvim-cmp autocompletion (+ LuaSnip)
        ├── conform.nvim.lua     # Format on save
        ├── debug.nvim.lua       # nvim-dap + dap-ui debugger (Rust/codelldb)
        ├── hover.nvim.lua       # Combined hover window (LSP/DAP/diagnostics/...)
        ├── indent-blankline.nvim.lua # Indentation guides
        ├── kanagawa.nvim.lua    # Color scheme (auto light/dark by time of day)
        ├── lint.nvim.lua        # Linters (nvim-lint)
        ├── lsp-config.nvim.lua  # Mason + mason-lspconfig v2 + nvim-lspconfig
        ├── lualine.nvim.lua     # Status line
        ├── move.nvim.lua        # Move lines/chars/blocks
        ├── multicursor.nvim.lua # Multiple cursors
        ├── neotree.nvim.lua     # File explorer
        ├── surround.nvim.lua    # Add/change/delete surrounding text
        ├── telescope.nvim.lua   # Fuzzy finder
        └── treesitter.nvim.lua  # Syntax parsing & queries (new API)
```

`init.lua` simply loads, in order:

```lua
require("config.options")   -- user options
require("config.lazy")      -- bootstrap + load all plugins
require("config.keymap")    -- global keymaps
```

---

## General Options

From `lua/config/options.lua`. Tip: run `:h <option>` inside Neovim to read up on any of these.

| Option | Value | Purpose |
| --- | --- | --- |
| `clipboard` | `unnamedplus` | Sync the `""` register with the system clipboard |
| `completeopt` | `menu, menuone, noselect` | Autocompletion popup behaviour |
| `mouse` | `a` | Enable mouse in all modes |
| `tabstop` / `softtabstop` / `shiftwidth` | `2` / `2` / `2` | Consistent 2-space indentation |
| `expandtab` | `true` | Use spaces instead of tabs |
| `autoindent` | `true` | Copy indent from the previous line |
| `swapfile` | `false` | No swap files |
| `undofile` | `true` | Persistent undo history |
| `updatetime` | `300` | cursorhold timeout (diagnostics, lualine) |
| `timeoutlen` | `400` | `<Esc>` recognition after `<leader>` |
| `number` | `true` | Show absolute line numbers |
| `relativenumber` | `false` | Relative line numbers (off) |
| `cursorline` | `true` | Highlight the current line |
| `splitbelow` / `splitright` | `true` | Splits open below / to the right |
| `termguicolors` | `true` | 24-bit RGB colors in the TUI |
| `showmode` | `false` | No `"-- INSERT --"` mode hint |
| `signcolumn` | `yes` | Stable sign column (no jumps when signs appear) |
| `scrolloff` / `sidescrolloff` | `8` / `8` | Keep context around the cursor |
| `incsearch` | `true` | Live-preview while searching |
| `hlsearch` | `true` | Keep highlighting matches |
| `ignorecase` / `smartcase` | `true` / `true` | Case-insensitive search unless query has uppercase |

Diagnostics are configured with `vim.diagnostic.config({ severity_sort = true, float = { border = "rounded" } })`.

---

## Plugins

Each plugin lives in its own file under `lua/plugins/` and is imported by
lazy.nvim. **All keybindings are documented in [SHORTCUTS.md](./SHORTCUTS.md).**

### UI

- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** — startup dashboard (startify theme, custom ASCII header)
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** — buffer tabs on the tabline (diagnostics indicators, LSP lightbulb-style icons)
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** — fast statusline, theme follows the active colorscheme
- **[kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)** — color scheme that auto-switches by time of day: 06:00–18:00 → `lotus` (light), otherwise → `wave` (dark)
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** — indentation guides

### Fuzzy finding & file explorer

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** — fuzzy finder with `fzf-native` ranking and the `ui-select` dropdown theme
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** — sidebar file explorer (v3.x, dotfiles visible)

### Editing

- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** — intelligent bracket/quote insertion
- **[move.nvim](https://github.com/fedepujol/move.nvim)** — move lines/chars/words/blocks without cut & paste
- **[nvim-surround](https://github.com/kylechui/nvim-surround)** — add/change/delete surrounding text
- **[multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim)** — multiple cursors (branch `1.0`)

### Autocompletion

- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** — completion engine, sources in priority order: `nvim_lsp` → `luasnip` → `path`, with `buffer` as fallback; snippets via [LuaSnip](https://github.com/L3MON4D3/LuaSnip) + [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

### Language support

Centralised in `lsp-config.nvim.lua`, `conform.nvim.lua`, `lint.nvim.lua`, and
`debug.nvim.lua`. All external tools are managed by **Mason**.

- **LSP** — [mason.nvim](https://github.com/mason-org/mason.nvim) + [mason-lspconfig v2](https://github.com/mason-org/mason-lspconfig.nvim) + [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Mason-installed servers are **enabled automatically** (`vim.lsp.enable`); `cmp-nvim-lsp` capabilities are applied to every server via the native `vim.lsp.config("*", ...)` API.
- **Hover** — [hover.nvim](https://github.com/lewis6991/hover.nvim) aggregates diagnostics, LSP, DAP, man pages and dictionary into one swimmable window on `K`.
- **Formatting** — [conform.nvim](https://github.com/stevearc/conform.nvim), format on save (500 ms, falls back to LSP formatting):

  | Filetype | Formatter(s) |
  | --- | --- |
  | Lua | `stylua` |
  | Rust | `rustfmt` (LSP fallback) |
  | YAML | `prettier` |
  | JSON | `prettier` |

- **Linting** — [nvim-lint](https://github.com/mfussenegger/nvim-lint) on open/create and re-lint on save (`BufWritePost`):

  | Filetype | Linter |
  | --- | --- |
  | Lua | `luacheck` |
  | Rust | `clippy` |
  | YAML | `yamllint` |
  | JSON | `jsonlint` |

- **Debugging** — [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui), wired for **Rust** via the `codelldb` adapter (Mason). `dap-ui` opens on launch/attach and closes on terminate/exit. Needs the Rust toolchain (`cargo`), `:MasonInstall codelldb`, and a `cargo build` so `target/debug/<binary>` exists.

### Syntax

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** (new API) — not lazy-loaded (needed early). Installs the `lua`, `rust`, and `vimdoc` parsers at startup; use `:TSInstall <lang>` for more. Parsers install into Neovim's `data/site` directory.

---

## Language Support

Install language tools on demand:

```sh
:MasonInstall rust-analyzer    # Rust LSP
:MasonInstall lua_ls           # Lua LSP
:MasonInstall pyright          # Python LSP
:MasonInstall bashls           # Bash LSP

:MasonInstall stylua rustfmt prettier     # formatters
:MasonInstall luacheck clippy yamllint jsonlint  # linters
:MasonInstall codelldb                 # Rust debugger adapter
:MasonInstall ripgrep                  # powers :Telescope live_grep
```

`mason-lspconfig` v2 auto-enables every installed server — or use the dedicated
command `:LspInstall <server>`.

---

## Notes & Gotchas

- **Neovim 0.12+ is required** — the pinned `nvim-treesitter` is the rewritten
  new-API version and `mason-lspconfig` v2 requires Nvim ≥ 0.11 with
  `nvim-lspconfig` 2.x.
- **Leader is `Space`** — most mappings read as ``<Space>...`` in the UI.
- **`<C-a>` keeps its default** (increment under cursor); use `<leader>q` to quit a window.
- **Keymap layout:** `<leader>s` belongs to multicursor (skip match); the
  neo-tree git-status float lives on `<leader>sg`.
- **Version pinning:** `lazy-lock.json` records exact plugin commits;
  `:Lazy update` / `:Lazy sync` move you forward. `nvim-surround` is pinned to
  `^4.0.0`; neo-tree pins `v3.x` and multicursor pins branch `1.0`.
- **Plugin auto-update checker is disabled** (`checker = { enabled = false }`);
  run `:Lazy update` manually.
- **Docs are local:** `docs/plugins/*.md` are the plugin READMEs fetched at the
  exact commits from `lazy-lock.json` — re-fetch after `:Lazy sync` if a pinned
  plugin's docs change.
