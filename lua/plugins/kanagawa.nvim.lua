return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local hour = os.date("*t").hour
		local theme = (hour >= 6 and hour < 18) and "lotus" or "wave"
		require("kanagawa").load(theme)
	end,
}
