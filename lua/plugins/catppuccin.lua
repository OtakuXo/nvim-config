return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {},
	config = function()
		local configs = require("catppuccin")

		configs.setup({
			transparent_background = true,
			term_colors = true,
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.90, -- percentage of the shade to apply to the inactive window
			},
		})
	end,
}
