return {
	-- 1. Mason: Package manager for LSP servers, DAP, linters, etc.
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				check_outdated_packages_on_open = false,
			},
		},
		config = function()
			require("mason").setup({
				ui = { border = "rounded" },
				-- Install tools to Neovim's data directory
				install_root = vim.fn.stdpath("data") .. "/mason",
			})
		end,
	},

	-- 2. Mason-LSPConfig: Bridges Mason with nvim-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
		config = function()
			require("mason-lspconfig").setup({
				-- Custom handler for every server Mason installs
				handlers = {
					function(server_name)
						local lspconfig = require("lspconfig")
						local capabilities = require("cmp_nvim_lsp").default_capabilities()

						lspconfig[server_name].setup({
							-- Enable cmp-nvim-lsp capabilities (better completion, hover, etc.)
							capabilities = capabilities,
						})
					end,
				},
			})
		end,
	},

	-- 3. nvim-lspconfig: Official LSP server configurations
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre", -- Load when opening a file
		config = function()
			local km = vim.keymap.set
			-- Standard LSP keymaps (silent + desc for better UX & debugging)
			-- km("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation", silent = true })
			km("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", silent = true })
			km("n", "gr", vim.lsp.buf.references, { desc = "Find references", silent = true })
			km("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", silent = true })
			km({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action", silent = true })
		end,
	},
}
