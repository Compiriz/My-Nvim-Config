return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "UIEnter",
	opts = {
		options = {
			-- "auto" follows the active colorscheme (kanagawa light/dark)
			theme = "auto",
		},
	},
}
