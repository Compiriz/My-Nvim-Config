local km = vim.keymap.set

-- Window Navigation
km("n", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Window: focus up", silent = true })
km("n", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Window: focus down", silent = true })
km("n", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Window: focus left", silent = true })
km("n", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Window: focus right", silent = true })

-- Resize Window Shortcuts
-- We map Ctrl+Shift+Arrows to the standard Ctrl+W resize commands
-- Using '5' as a prefix makes the resize step larger (5 lines/cols)
km("n", "<C-S-Up>", "<C-W>5+", { desc = "Increase Window Height", silent = true })
km("n", "<C-S-Down>", "<C-W>5-", { desc = "Decrease Window Height", silent = true })

-- Navigation history (IntelliJ-style Back/Forward; the built-in jump list)
-- <C-o> / <C-i> do the same natively and are kept unmapped so counts work (2<C-o>)
km("n", "<C-S-Left>", "<Cmd>pop<CR>", { desc = "Jump: previous position", silent = true })
km("n", "<C-S-Right>", "<Cmd>goto<CR>", { desc = "Jump: next position", silent = true })

-- Window Creation
km("n", "<C-t>", "<Cmd>new<CR>", { desc = "New horizontal split", silent = true })
km("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit window", silent = true })
km("t", "<C-w>h", "<C-\\><C-n><C-w>h", { desc = "Terminal: leave and go left", silent = true })

-- Terminal
km("n", "tt", "<Cmd>terminal<CR>", { desc = "Open terminal", silent = true })

-- Diagnostics (built-in vim.diagnostic, no plugin needed)
km("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", silent = true })
km("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", silent = true })
km("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic float", silent = true })
