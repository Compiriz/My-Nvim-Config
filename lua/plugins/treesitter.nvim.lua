return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- Do not lazy load treesitter
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			-- The new API is minimal. Highlighting is enabled by default.
			-- If you want to customize the install directory:
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Optional: Install parsers on startup (runs asynchronously)
		require("nvim-treesitter").install({ "lua", "rust", "vimdoc" })
	end,
}
