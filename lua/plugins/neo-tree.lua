return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			local neo_tree = require("neo-tree")
			neo_tree.setup({
				filesystem = {
					filterd_item = {
						visible = true,
						hide_dotfiles = true,
						hide_gitignored = false,
					},
				},
				source_selector = {
					winbar = true,
					content_layout = "end", -- string
				},
			})
			vim.keymap.set("n", "<S-f>", ":Neotree filesystem reveal current<CR>", {})
		end,
	},
}
