return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 10000,
		opts = {
			transparent = true,
			styles = {
				keywords = { bold = true },
				functions = { bold = true },
				variables = { bold = true },
				sidebars = "transparent",
				floats = "transparent",
			},
			lualine_bold = true,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
