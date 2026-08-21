return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local km = vim.keymap.set

		-- 1. Adapter: codelldb
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- 2. Rust Configurations
		dap.configurations.rust = {
			{
				name = "Debug Rust Binary",
				type = "codelldb",
				request = "launch",
				program = function()
					local dir = vim.fn.getcwd()
					local binary_name = vim.fn.fnamemodify(dir, ":t")
					local path = dir .. "/target/debug/" .. binary_name
					-- Fallback if binary doesn't exist yet
					if vim.fn.filereadable(path) == 0 then
						vim.notify("Binary not found. Run `cargo build` first.", vim.log.levels.WARN)
						return ""
					end
					return path
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				name = "Attach to Rust Process",
				type = "codelldb",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}

		-- 3. DAP UI Setup
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			mappings = { expand = { "<CR>", "<2-LeftMouse>" }, open = "o", remove = "d" },
		})

		-- 4. Auto open/close UI
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- 5. Keymaps
		km("n", "<Leader><C-F8>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		km("n", "<Leader>F8", dap.continue, { desc = "Continue" })
		km("n", "<Leader>Fn", dap.step_over, { desc = "Step Over" })
		km("n", "<Leader>Fm", dap.step_into, { desc = "Step Into" })
		km("n", "<Leader>Fo", dap.step_out, { desc = "Step Out" })
		km("n", "<Leader>Fc", function()
			vim.dap.clear_breakpoints()
		end, { desc = "Clear All Breakpoints" })
		km("n", "<Leader>Fu", function()
			dapui.toggle()
		end, { desc = "Toggle DAP UI" })
		km("n", "<Leader>Fv", function()
			require("dap.repl").open()
		end, { desc = "Open REPL" })
	end,
}
