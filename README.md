# Just My Nvim Config :)

A modern, fully Lua-based [Neovim](https://neovim.io) configuration built around
[lazy.nvim](https://github.com/folke/lazy.nvim). It covers LSP, autocompletion,
formatting, linting, debugging, fuzzy finding, a file explorer, and a bunch of
quality-of-life plugins — all loaded with lazy-loading where it helps startup.

> **Leader key:** `Space` (``<Space>``). `maplocalleader` is `\`.

---

## Requirements

| Tool | Notes |
| --- | --- |
| **Neovim** | A recent stable release (0.10+ recommended; 0.11+ for best compatibility) |
| **Git** | Used by lazy.nvim to clone plugins and by Mason to fetch tools |
| **C compiler** | Needed to build Treesitter parsers and `telescope-fzf-native` |
| **ripgrep** | Powers Telescope `live_grep` (`:Mason install ripgrep` or your package manager) |

Everything else (LSP servers, linters, formatters, the debugger) is installed
through [Mason](#language-support) with `:Mason install <tool>`.

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
:Lazy update      # update plugins (also runs an automatic checker)
:TSUpdate         # update Treesitter parsers
:MasonUpdate     # update Mason-managed tools
```

---

## Project Structure

```text
nvim/
├── init.lua                     # Entry point: loads config modules
├── .luarc.json                  # Lua LSP server settings (for editing this config)
├── lazy-lock.json               # Pinned plugin versions (from lazy.nvim)
└── lua/
    ├── config/
    │   ├── options.lua          # vim.g / vim.opt settings
    │   ├── lazy.lua             # lazy.nvim bootstrap + setup
    │   └── keymap.lua           # Global (non-plugin) keymaps
    └── plugins/                 # One spec file per plugin (imported by lazy.nvim)
        ├── alpha.lua            # Startup screen
        ├── autopairs.nvim.lua   # Automatic bracket/quote pairs
        ├── bufferline.nvim.lua  # Tab-line buffer UI
        ├── completions.lua      # nvim-cmp autocompletion
        ├── conform.nvim.lua     # Format on save
        ├── debug.nvim.lua       # nvim-dap + dap-ui debugger (Rust)
        ├── hover.nvim.lua       # Combined hover window (LSP/DAP/diagnostics/...)
        ├── kanagawa.nvim.lua    # Color scheme (auto light/dark)
        ├── lint.nvim.lua        # Linters
        ├── lsp-config.nvim.lua  # Mason + LSP servers
        ├── lualine.nvim.lua     # Status line
        ├── move.nvim.lua        # Move lines/chars/blocks
        ├── multicursor.nvim.lua # Multiple cursors
        ├── neotree.nvim.lua     # File explorer
        ├── surround.nvim.lua    # Add/change/delete surrounding text
        ├── telescope.nvim.lua   # Fuzzy finder
        └── treesitter.nvim.lua  # Syntax highlighting & parsing
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
| `tabstop` | `2` | Visual width of a TAB |
| `softtabstop` | `2` | Spaces consumed by `<BS>` on a tab |
| `shiftwidth` | `4` | Indent inserted on `>>`/`<<` |
| `expandtab` | `true` | Use spaces instead of tabs (Python-friendly) |
| `autoindent` | `true` | Copy indent from the previous line |
| `number` | `true` | Show absolute line numbers |
| `relativenumber` | `true` | Show relative line numbers |
| `cursorline` | `true` | Highlight the current line |
| `splitbelow` | `true` | New horizontal splits open below |
| `splitright` | `true` | New vertical splits open to the right |
| `incsearch` | `true` | Live-preview while searching |
| `hlsearch` | `true` | Keep highlighting matches |
| `ignorecase` | `true` | Case-insensitive search by default |
| `smartcase` | `true` | ...but case-sensitive if the query has uppercase |

> `termguicolors` and `showmode` are intentionally left commented out in the source.

---

## Global Keymaps

From `lua/config/keymap.lua` (independent of any plugin).

### Window navigation

| Key | Action |
| --- | --- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move focus left / down / up / right between windows |

### Window resizing

| Key | Action |
| --- | --- |
| `<C-S-Up>` | Increase window height (by 5 lines) |
| `<C-S-Down>` | Decrease window height (by 5 lines) |

> The width-resize mappings (`<C-S-Left>` / `<C-S-Right>`) are present but commented out.

### Windows & terminal

| Key | Action |
| --- | --- |
| `<C-t>` | Open a new horizontal split |
| `<C-a>` | Quit the current window (`:q`) |
| `tt` | Open a floating/normal terminal |
| `<C-w>h` *(Terminal mode)* | Leave terminal and move to the left window |

---

## Plugins

Each plugin lives in its own file under `lua/plugins/` and is imported by
lazy.nvim. Keybindings below use ``<leader>`` = `Space`.

### UI

#### [alpha-nvim](https://github.com/goolord/alpha-nvim) — `alpha.lua`

Startup dashboard using the **startify** theme with a custom ASCII-art header.
No custom keymaps.

#### [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) — `bufferline.nvim.lua`

Buffer tabs shown on the tab line (mode `buffers`, slanted separators, LSP
diagnostics indicators, `▎` active-buffer indicator). Loaded on `BufReadPost`.

| Key | Action |
| --- | --- |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>WA` | Close current buffer |
| `<leader>b1` … `<leader>b9` | Jump to buffer 1–9 |

Mouse: left-click switches buffers, right-click (`bdelete!`) closes them.

#### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — `lualine.nvim.lua`

Fast status line using the **gruvbox_light** theme and web-devicons.

#### [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) — `kanagawa.nvim.lua`

Color scheme that **auto-switches** based on the time of day:

- **06:00–18:00** → `lotus` (light)
- otherwise → `wave` (dark)

### Fuzzy finding

#### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — `telescope.nvim.lua`

Fuzzy finder with the `ui-select` extension and native `fzf` ranking
(`telescope-fzf-native.nvim`, built with `make`).

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

### File explorer

#### [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) — `neotree.nvim.lua`

Sidebar file explorer (branch `v3.x`), showing dotfiles/hidden items.

| Key | Action |
| --- | --- |
| `<C-n>` | Toggle filesystem tree (reveals current file, left side) |
| `<leader>s` | Open a floating `git_status` view |

### Editing & navigation

#### [nvim-autopairs](https://github.com/windwp/nvim-autopairs) — `autopairs.nvim.lua`

Intelligently inserts/removes matching brackets, quotes, and parentheses.
Default setup, loaded on `InsertEnter`.

#### [move.nvim](https://github.com/fedepujol/move.nvim) — `move.nvim.lua`

Move text without cut/paste.

| Mode | Key | Action |
| --- | --- | --- |
| Normal | `<C-S-j>` / `<C-S-k>` | Move current line up / down |
| Normal | `<C-S-h>` / `<C-S-l>` | Move character left / right |
| Normal | `<leader>wf` / `<leader>wb` | Move word left / right |
| Visual | `<C-S-j>` / `<C-S-k>` | Move block up / down |
| Visual | `<C-S-h>` / `<C-S-l>` | Move block left / right |

#### [nvim-surround](https://github.com/kylechui/nvim-surround) — `surround.nvim.lua`

Add, change, and delete surrounding text (quotes, parens, brackets, tags,
etc.). Pinned to `^4.0.0`; uses the plugin's default keymaps (`ds`, `cs`, `ys`,
`v2s`).

#### [multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim) — `multicursor.nvim.lua`

Multiple cursors (branch `1.0`).

| Key | Action |
| --- | --- |
| `<C-Up>` / `<C-Down>` | Add a cursor on the line above / below |
| `<leader><Up>` / `<leader><Down>` | Add a cursor, skipping the adjacent one |
| `<leader>n` / `<leader>N` | Add cursor to next / previous matching word |
| `<leader>s` / `<leader>S` | Skip next / previous matching word |
| `<C-LeftMouse>` (click/drag) | Add cursors via the mouse |
| `<C-q>` | Toggle all cursors on/off |

*Multi-cursor layer (only active while extra cursors exist):*

| Key | Action |
| --- | --- |
| `<C-Left>` / `<C-Right>` | Move the "main" cursor to the previous / next cursor |
| `<leader>x` | Delete the main cursor |
| `<Esc>` | Enable / clear all cursors |

### Autocompletion

#### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) — `completions.lua`

Completion engine, loaded on `InsertEnter` to keep startup fast. Bordered
rounded popup for both the menu and docs.

**Sources (in priority order):** `nvim_lsp` → `luasnip` → `path`, with
`buffer` as a fallback. Snippets come from [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
(loaded from VS Code snippet packs).

| Key (Insert/Snippet) | Action |
| --- | --- |
| `<C-Space>` | Manually open the completion menu |
| `<CR>` | Confirm the selected item |
| `<Tab>` | Next item / expand snippet / jump to next placeholder |
| `<S-Tab>` | Previous item / jump to previous placeholder |
| `<C-f>` / `<C-b>` | Scroll documentation down / up |

### Language Support

Centralised in `lsp-config.nvim.lua`, `conform.nvim.lua`, `lint.nvim.lua`, and
`debug.nvim.lua`. All external tools are managed by **Mason** — install them
with `:Mason` (or `:Mason install <tool>`).

#### LSP — Mason + mason-lspconfig + nvim-lspconfig

`mason-lspconfig` auto-configures **any** server you install through Mason,
injecting `cmp-nvim-lsp` capabilities for richer completion and hover.
Common installs:

```sh
:Mason install rust-analyzer    # Rust
:Mason install lua_ls           # Lua
:Mason install pyright          # Python
:Mason install bashls           # Bash
```

| Key | Action |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action (Normal + Visual) |

> `K` is intentionally *not* mapped to `vim.lsp.buf.hover` here —
> `hover.nvim` owns `K` (see below).

#### Hover — [hover.nvim](https://github.com/lewis6991/hover.nvim) — `hover.nvim.lua`

A single, swimmable hover window that aggregates several sources: **diagnostics**,
**LSP**, **DAP**, **man pages**, and **dictionary** (plus an optional `gh`
provider). Rounded border, shows the source title, and supports mouse hover
(500 ms delay).

| Key | Action |
| --- | --- |
| `K` | Open the hover window |
| `gK` | Enter / toggle focus into the hover window |
| `<C-o>` / `<C-p>` | Cycle to the next / previous source |

#### Formatting — [conform.nvim](https://github.com/stevearc/conform.nvim) — `conform.nvim.lua`

Formats on save (500 ms timeout, falls back to LSP formatting). Loaded on
`BufWritePre`. Formatters per file type:

| Filetype | Formatter(s) |
| --- | --- |
| Lua | `stylua` |
| Rust | `rustfmt` |
| YAML | `prettier` |
| JSON | `prettier` |

Install with e.g. `:Mason install stylua rustfmt prettier`.

#### Linting — [nvim-lint](https://github.com/mfussenegger/nvim-lint) — `lint.nvim.lua`

Runs linters on open/create and automatically re-lints on save (`BufWritePost`).

| Filetype | Linter |
| --- | --- |
| Lua | `luacheck` |
| Rust | `clippy` |
| YAML | `yamllint` |
| JSON | `jsonlint` |

Install with e.g. `:Mason install luacheck clippy yamllint jsonlint`.

#### Debugging — [nvim-dap](https://github.com/mfussenegger/nvim-dap) + [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) — `debug.nvim.lua`

Debugger wired up for **Rust** via the `codelldb` adapter (installed to
Mason's `bin` directory). `dap-ui` opens automatically on launch/attach and
closes on terminate/exit.

> You need the Rust toolchain (`cargo`) and `:Mason install codelldb`.
> Run `cargo build` first so `target/debug/<binary>` exists.

| Key | Action |
| --- | --- |
| `<leader><C-F8>` | Toggle breakpoint |
| `<leader>F8` | Continue / resume |
| `<leader>Fn` | Step over |
| `<leader>Fm` | Step into |
| `<leader>Fo` | Step out |
| `<leader>Fc` | Clear all breakpoints |
| `<leader>Fu` | Toggle the DAP UI |
| `<leader>Fv` | Open the DAP REPL |

Configured launch/attach targets: **Debug Rust Binary** and **Attach to Rust
Process**.

### Syntax highlighting

#### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — `treesitter.nvim.lua`

Not lazy-loaded (needed early for highlighting). Installs the `lua`, `rust`,
and `vimdoc` parsers on startup; run `:TSUpdate` / `:TSInstall <lang>` to add
more. Parsers are installed into Neovim's `data/site` directory.

---

## Notes & Gotchas

- **Keymap overlap:** `<leader>s` is bound both by neo-tree (floating git
  status) and by multicursor (skip a match). As written, multicursor's mapping
  is defined later and takes precedence in normal/visual modes.
- **`<C-a>` = quit:** the global keymap binds `<C-a>` to `:q` in normal mode,
  overriding Neovim's default "increment number under cursor" behaviour.
- **Leader is `Space`:** most mappings read as ``<Space>...`` in the UI.
- **Version pinning:** `lazy-lock.json` records exact plugin commits;
  `:Lazy update` moves you forward. `nvim-surround` is additionally pinned to
  `^4.0.0`, and multicursor/neo-tree pin specific branches.
