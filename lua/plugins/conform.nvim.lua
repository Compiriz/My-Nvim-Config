return {
	"stevearc/conform.nvim",
	-- Lazy load on save or command
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	-- Use opts instead of config
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			yaml = { "prettier" },
			json = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
