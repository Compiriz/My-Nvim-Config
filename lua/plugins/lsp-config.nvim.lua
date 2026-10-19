return {
	-- 1. Mason: Package manager for LSP servers, DAP adapters, linters, formatters
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				check_outdated_packages_on_open = false,
			},
		},
	},

	-- 2. Mason-LSPConfig (v2): automatically enables (vim.lsp.enable) every
	--    server installed through Mason. No custom handlers needed anymore.
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},

	-- 3. nvim-lspconfig: server configurations + global LSP settings
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		event = { "BufReadPre", "BufNewFile" }, -- load when opening a file
		config = function()
			-- Native LSP config API (Nvim 0.11+): applies cmp-nvim-lsp
			-- capabilities (better completion, hover, ...) to every server.
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			local km = vim.keymap.set
			-- Standard LSP keymaps (silent + desc for better UX & debugging)
			-- K is intentionally NOT mapped here: hover.nvim owns K.
			km("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", silent = true })
			km("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", silent = true })
			km("n", "gr", vim.lsp.buf.references, { desc = "Find references", silent = true })
			km("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", silent = true })
			km({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", silent = true })
		end,
	},
}
