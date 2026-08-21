return {
	"fedepujol/move.nvim",
	keys = {
		-- Normal Mode
		{ "<C-S-j>", ":MoveLine(1)<CR>", desc = "Move Line Up" },
		{ "<C-S-k>", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
		{ "<C-S-h>", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
		{ "<C-S-l>", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
		{ "<leader>wf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left" },
		{ "<leader>wb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right" },
		-- Visual Mode
		{ "<C-S-j>", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
		{ "<C-S-k>", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
		{ "<C-S-h>", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
		{ "<C-S-l>", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right" },
	},
	config = function()
		require("move").setup({})
	end,
}
