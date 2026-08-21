return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" }, -- Load on file open/create
	config = function()
		-- Map linters to filetypes
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			rust = { "clippy" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
		}

		-- Optional: Auto-lint on save
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
