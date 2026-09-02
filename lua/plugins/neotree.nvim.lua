return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	keys = {
		{ "<C-n>", desc = "Toggle file explorer" },
		{ "<leader>s", desc = "Git status (float)" },
	},
	cmd = { "Neotree" },
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
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", {
			desc = "Toggle file explorer",
			silent = true,
			noremap = true,
		})
		vim.keymap.set("n", "<leader>s", ":Neotree float git_status<CR>", {
			desc = "Git status (float)",
			silent = true,
			noremap = true,
		})
	end,
}
