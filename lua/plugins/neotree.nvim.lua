return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	-- Mappings are set here (not in a config fn) so the FIRST press works:
	-- the key triggers the plugin load and immediately runs the command.
	keys = {
		{ "<C-n>", "<cmd>Neotree filesystem reveal toggle left<cr>", desc = "Toggle file explorer" },
		{ "<leader>sg", "<cmd>Neotree float git_status<cr>", desc = "Git status (float)" },
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
}
