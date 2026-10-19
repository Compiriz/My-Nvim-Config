-- Leaders must be set before plugins load (config.lazy runs right after this)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in nvim

-- Tab (2 spaces everywhere: tabstop == shiftwidth, as recommended by :h 'shiftwidth')
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.shiftwidth = 2 -- spaces inserted on >>/<< and autoindent
vim.opt.expandtab = true -- tabs are spaces

-- Nvim behavior
vim.opt.autoindent = true
vim.opt.swapfile = false -- no swap files (modern default)
vim.opt.undofile = true -- persistent undo history
vim.opt.updatetime = 300 -- cursorhold timeout (diagnostics, lualine)
vim.opt.timeoutlen = 400 -- how fast <Esc> is recognized after <leader>

-- UI config
vim.opt.number = true -- show absolute line number
vim.opt.relativenumber = false -- relative line numbers (kept off)
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new horizontal split bottom
vim.opt.splitright = true -- open new vertical splits right
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, we don't need the "-- INSERT --" mode hint
vim.opt.signcolumn = "yes" -- always show sign column (no jumps when signs appear)
vim.opt.scrolloff = 8 -- minimal lines above/below the cursor
vim.opt.sidescrolloff = 8 -- minimal columns left/right of the cursor

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- highlight all search matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Diagnostics (LSP + nvim-lint)
vim.diagnostic.config({
	severity_sort = true, -- sort by severity, not by position
	float = { border = "rounded" },
})
