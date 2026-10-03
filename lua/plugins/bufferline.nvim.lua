return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "BufReadPost",
	keys = {
		{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
		{ "<leader>WA", "<cmd>BufferLineClose<cr>", desc = "Close Buffer" },
		{ "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
		{ "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
		{ "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
		{ "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
		{ "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
		{ "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
		{ "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
		{ "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Buffer 8" },
		{ "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Buffer 9" },
	},
	opts = {
		options = {
			mode = "buffers", -- 'buffers' or 'tabs'
			separator_style = "slant", -- 'slant', 'padded_slant', 'slope', 'padded_slope', 'thick', 'thin', 'rounded', 'arrow', 'arrow_trunc'
			show_buffer_close_icons = true,
			auto_hide = false, -- hide tabline when only 1 buffer
			diagnostics = "nvim_lsp", -- or 'coc', 'alexherbo2/nvim-diagnostic', 'nvim-lightbulb'
			diagnostics_update_in_insert = false,
			max_name_length = 18,
			sort_by = "insert_at_end", -- 'insert_at_end', 'insert_at_start', 'id', 'extension', 'relative_directory', 'directory', 'modification_time', 'name'
			right_mouse_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			indicator = {
				icon = "▎",
				style = "icon", -- 'icon', 'underline', 'none'
			},
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e:find("error") and " " or (e:find("warn") and " " or " ")
					s = s .. n .. sym
				end
				return s
			end,
		},
	},
}
