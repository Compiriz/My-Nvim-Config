return {
	-- 4. Hover.nvim: Advanced hover framework
	{
		"lewis6991/hover.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		event = "VeryLazy", -- Loaded immediately
		config = function()
			require("hover").setup({
				-- Core providers to check for hover info
				providers = {
					"hover.providers.diagnostic", -- Show diagnostics (errors/warnings)
					"hover.providers.lsp", -- Show LSP documentation
					"hover.providers.dap", -- Show DAP info (if debugging)
					"hover.providers.man", -- Show man pages for commands
					"hover.providers.dictionary", -- Show dictionary definitions
					-- Optional: 'hover.providers.gh' (requires gh cli)
				},

				-- Visual appearance (matches your Kanagawa/Mason style)
				preview_opts = {
					border = "rounded", -- Rounded borders for a cleaner look
				},

				-- Show the source of the hover info (e.g., "LSP", "Diagnostic")
				title = true,

				-- Mouse support (optional: hover with mouse over symbols)
				mouse_providers = {
					"hover.providers.lsp",
				},
				mouse_delay = 500, -- Delay before showing on mouse hover
			})

			-- Keymaps
			local km = vim.keymap.set

			-- K: Open hover window
			km("n", "K", function()
				require("hover").open()
			end, { desc = "Open Hover", silent = true })

			-- gK: Enter the hover window (toggle focus)
			km("n", "gK", function()
				require("hover").enter()
			end, { desc = "Enter Hover", silent = true })

			-- C-p / C-o: Switch between providers (e.g., LSP -> Diagnostic)
			km("n", "<C-p>", function()
				require("hover").switch("previous")
			end, { desc = "Hover: Previous Source", silent = true })

			km("n", "<C-o>", function()
				require("hover").switch("next")
			end, { desc = "Hover: Next Source", silent = true })
		end,
	},
}
