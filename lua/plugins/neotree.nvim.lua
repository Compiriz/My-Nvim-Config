return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_hidden = false,
			},
		},
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>s", ":Neotree float git_status<CR>", { silent = true, noremap = true })
	end,
}
