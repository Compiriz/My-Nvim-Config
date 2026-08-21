return {
	-- Core completion engine
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- Completion sources
		"hrsh7th/cmp-nvim-lsp", -- LSP completions (semantic, type-aware)
		"hrsh7th/cmp-buffer", -- Words from current buffer
		"hrsh7th/cmp-path", -- Filesystem paths
		-- Snippet engine (optional but highly recommended)
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter", -- Load only when entering insert mode (saves startup time)
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").load({})

		cmp.setup({
			-- Snippet expansion handler
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
					border = "rounded",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
					border = "rounded",
				}),
			},
			-- Keybindings inside the completion menu
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down
				["<C-Space>"] = cmp.mapping.complete(), -- Force open menu
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selection
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback() -- Default tab behavior
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			-- Completion sources (order matters: LSP first, then path, then buffer)
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}
