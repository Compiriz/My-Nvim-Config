local km = vim.keymap.set

-- Window Navigation
km("n", "<C-k>", "<Cmd>wincmd k<CR>", { silent = true, noremap = true })
km("n", "<C-j>", "<Cmd>wincmd j<CR>", { silent = true, noremap = true })
km("n", "<C-h>", "<Cmd>wincmd h<CR>", { silent = true, noremap = true })
km("n", "<C-l>", "<Cmd>wincmd l<CR>", { silent = true, noremap = true })

-- Resize Window Shortcuts
-- We map Ctrl+Shift+Arrows to the standard Ctrl+W resize commands
-- Using '5' as a prefix makes the resize step larger (5 lines/cols)

-- Increase Height
km("n", "<C-S-Up>", "<C-W>5+", { desc = "Increase Window Height" })
-- Decrease Height
km("n", "<C-S-Down>", "<C-W>5-", { desc = "Decrease Window Height" })
-- Increase Width
-- km("n", "<C-S-Right>", "<C-W>5>", { desc = "Increase Window Width" })
-- Decrease Width
-- km("n", "<C-S-Left>", "<C-W>5<", { desc = "Decrease Window Width" })

-- Window Creation
km("n", "<C-t>", "<Cmd>new<CR>", { silent = true, noremap = true })
km("n", "<C-a>", "<Cmd>q<CR>", { silent = true, noremap = true })
km("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })

km("n", "tt", "<Cmd>terminal<CR>", { silent = true, noremap = true })
