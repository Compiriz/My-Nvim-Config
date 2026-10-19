# Shortcuts & Commands

Complete keybinding and command reference for this config.
Plugin docs (READMEs pinned to `lazy-lock.json`) live in [`docs/plugins/`](./docs/plugins/).

> **Leader key:** `Space` (`<leader>`). `maplocalleader` is `\`.

---

## Global keymaps (`lua/config/keymap.lua`)

### Window navigation

| Key | Action |
| --- | --- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Focus window left / down / up / right |

### Window resizing (step of 5)

| Key | Action |
| --- | --- |
| `<C-S-Up>` | Increase window height |
| `<C-S-Down>` | Decrease window height |
| `<C-S-Right>` / `<C-S-Left>` | (commented out — width resize; some terminals don't send Shift+Ctrl+Arrows) |

### Windows & terminal

| Key | Action |
| --- | --- |
| `<C-t>` | New horizontal split |
| `<leader>q` | Quit current window (`:q`) |
| `tt` | Open terminal |
| `<C-w>h` *(terminal mode)* | Leave terminal and move to the left window |

### Diagnostics (built-in `vim.diagnostic`)

| Key | Action |
| --- | --- |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<leader>e` | Show diagnostic float |

### Navigation history (IntelliJ-style Back/Forward, built-in jump list)

| Key | Action |
| --- | --- |
| `<C-o>` | Back to previous position (e.g. `2<C-o>` goes back 2 jumps) |
| `<C-i>` | Forward to next position |
| `<C-S-Left>` | Back to previous position (IntelliJ alias) |
| `<C-S-Right>` | Forward to next position (IntelliJ alias) |

`<C-o>` / `<C-i>` are Neovim defaults (intentionally not remapped, so counts work).

---

## LSP (`lsp-config.nvim.lua`)

| Key | Mode | Action |
| --- | --- | --- |
| `gd` | n | Go to definition |
| `gD` | n | Go to declaration |
| `gr` | n | Find references |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n, v | Code action |

`K` is owned by [hover.nvim](#hoverhovernvim) (combined hover window).

### Hover (hover.nvim)

| Key | Action |
| --- | --- |
| `K` | Open hover window (LSP / diagnostics / DAP / man / dictionary) |
| `gK` | Enter / toggle focus into the hover window |
| `<C-n>` / `<C-p>` | Switch to next / previous source |

---

## Completion (nvim-cmp, Insert/Snippet mode)

| Key | Action |
| --- | --- |
| `<C-Space>` | Manually open the completion menu |
| `<CR>` | Confirm the selected item (replaces typed text) |
| `<Tab>` | Next item / expand snippet / next placeholder |
| `<S-Tab>` | Previous item / previous placeholder |
| `<C-f>` / `<C-b>` | Scroll documentation down / up |

---

## Buffers (bufferline.nvim)

| Key | Action |
| --- | --- |
| `<C-Tab>` | **Buffer switcher** — fuzzy window of all open buffers (IDE-style) |
| `<C-S-Tab>` | **Recent files** — fuzzy window of previously opened files (VS Code Ctrl+Tab) |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>WA` | Close current buffer |
| `<leader>b1` … `<leader>b9` | Jump to buffer 1–9 |
| Left click | Switch to buffer |
| Right click | Close buffer (`bdelete!`) |

> `<C-Tab>` / `<C-S-Tab>` require a terminal that delivers those keys (kitty,
> wezterm, alacritty, foot). Some xterm-style terminals and tmux < 3.3 (needs
> `set -g xterm-keys on`) don't — fallback: `<leader>fb` and `:Telescope oldfiles`.

---

## Fuzzy finding (telescope.nvim)

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (needs `ripgrep`) |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

Inside a picker: `?` (normal) / `<C-/>` (insert) shows all picker actions.

---

## File explorer (neo-tree.nvim)

| Key | Action |
| --- | --- |
| `<C-n>` | Toggle filesystem tree (reveals current file, left side) |
| `<leader>sg` | Floating `git_status` view |

---

## Moving text (move.nvim)

| Mode | Key | Action |
| --- | --- | --- |
| Normal | `<C-S-j>` / `<C-S-k>` | Move line down / up |
| Normal | `<C-S-h>` / `<C-S-l>` | Move character left / right |
| Normal | `<leader>wf` / `<leader>wb` | Move word left / right |
| Visual | `<C-S-j>` / `<C-S-k>` | Move block down / up |
| Visual | `<C-S-h>` / `<C-S-l>` | Move block left / right |

---

## Multiple cursors (multicursor.nvim)

| Key | Mode | Action |
| --- | --- | --- |
| `<C-Up>` / `<C-Down>` | n, x | Add cursor on line above / below |
| `<leader><Up>` / `<leader><Down>` | n, x | Add cursor above / below, skipping the adjacent line |
| `<leader>n` / `<leader>N` | n, x | Add cursor on next / previous matching word |
| `<leader>s` / `<leader>S` | n, x | Skip next / previous matching word |
| `<C-LeftMouse>` (click / drag) | n | Add cursors via the mouse |
| `<C-q>` | n, x | Enable / disable all cursors |

*Multi-cursor layer (active only while extra cursors exist):*

| Key | Action |
| --- | --- |
| `<C-Left>` / `<C-Right>` | Move the "main" cursor to previous / next cursor |
| `<leader>x` | Delete the main cursor |
| `<Esc>` | Enable / clear all cursors |

---

## Surroundings (nvim-surround, default keymaps)

| Key | Action |
| --- | --- |
| `ds` | Delete surrounding (`ds"`, `ds)`, …) |
| `cs` | Change surrounding (`cs"'`, …) |
| `ys` | Add surrounding (motion/text-object) |
| `v2s` | Visual add surrounding |

---

## Debugging (nvim-dap + nvim-dap-ui, Rust via codelldb)

| Key | Action |
| --- | --- |
| `<leader><C-F8>` | Toggle breakpoint |
| `<leader>F8` | Continue / resume |
| `<leader>Fn` | Step over |
| `<leader>Fm` | Step into |
| `<leader>Fo` | Step out |
| `<leader>Fc` | Clear all breakpoints |
| `<leader>Fu` | Toggle DAP UI |
| `<leader>Fv` | Open REPL |

---

## Commands

### Plugins (lazy.nvim)

| Command | Action |
| --- | --- |
| `:Lazy` | Plugin manager UI |
| `:Lazy sync` | Install/update plugins to match the spec |
| `:Lazy update` | Check for and update outdated plugins |
| `:Lazy health` | lazy.nvim healthcheck |
| `:Lazy restore` | Restore from `lazy-lock.json` |

### Mason (external tools)

| Command | Action |
| --- | --- |
| `:Mason` | Graphical tool manager |
| `:MasonInstall <pkg> ...` | Install tool(s), e.g. `:MasonInstall rust-analyzer stylua` |
| `:MasonUninstall <pkg> ...` | Uninstall tool(s) |
| `:MasonUninstallAll` | Uninstall everything |
| `:MasonUpdate` | Update registries |
| `:MasonLog` | Open Mason log |

### LSP (mason-lspconfig v2 + nvim-lspconfig)

| Command | Action |
| --- | --- |
| `:LspInstall <server>` | Install the LSP server via Mason (auto-enabled afterwards) |
| `:LspUninstall <server>` | Uninstall the LSP server |

Servers are enabled automatically by `mason-lspconfig` once installed — no manual `vim.lsp.enable()` needed.

### Treesitter (new API)

| Command | Action |
| --- | --- |
| `:TSInstall <lang> ...` | Install parser(s) + queries, e.g. `:TSInstall lua rust vimdoc` |
| `:TSUpdate [lang ...]` | Update installed parser(s) |
| `:TSUninstall <lang>` | Remove a parser |
| `:TSLog` | Open the treesitter log |

### Formatting (conform.nvim)

| Command | Action |
| --- | --- |
| `:Conform` | Format the current buffer |
| `:ConformInfo` | Show configured/available formatters + log location |

Formatting also runs automatically on save (see `conform.nvim.lua`).

### Neo-tree

| Command | Action |
| --- | --- |
| `:Neotree` | Toggle the default source |
| `:Neotree filesystem` | Show filesystem window |
| `:Neotree git_status` | Show git status window |
| `:Neotree float git_status` | Git status in a floating window |

### Telescope

| Command | Action |
| --- | --- |
| `:Telescope` | Show all pickers |
| `:Telescope <picker>` | Run a picker, e.g. `:Telescope find_files` |

Common pickers: `find_files`, `git_files`, `live_grep`, `grep_string`, `buffers`, `oldfiles`, `git_commits`, `git_bcommits`, `git_branches`, `git_status`, `diagnostics`, `lsp_document_symbols`, `help_tags`, `man_pages`, `colorscheme`, `resume`.

### Bufferline

| Command | Action |
| --- | --- |
| `:BufferLineCycleNext` / `:BufferLineCyclePrev` | Cycle buffers |
| `:BufferLineClose` | Close buffer under cursor |
| `:BufferLineGoToBuffer <n>` | Jump to buffer n |

### nvim-dap

`nvim-dap` exposes `:Dap<action>` commands for its actions, e.g.
`:DapContinue`, `:DapToggleBreakpoint`, `:DapStepOver`, `:DapStepInto`,
`:DapStepOut`, `:DapStop`, `:DapTerminate`.

### Healthchecks

| Command | Action |
| --- | --- |
| `:checkhealth` | All |
| `:checkhealth mason` | Mason / tools |
| `:checkhealth telescope` | Telescope + extensions |
| `:checkhealth nvim-treesitter` | Treesitter parsers |
| `:checkhealth conform` | Formatters |
