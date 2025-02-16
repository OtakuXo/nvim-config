return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.ts_ls.setup({ capabilites = capabilities })
			lspconfig.lua_ls.setup({ capabilites = capabilities })
			lspconfig.cssls.setup({ capabilites = capabilities })
			lspconfig.html.setup({ capabilites = capabilities })
			lspconfig.eslint.setup({ capabilites = capabilities })
			lspconfig.jsonls.setup({ capabilites = capabilities })
			lspconfig.tailwindcss.setup({ capabilites = capabilities })

			vim.keymap.set("n", "B", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.code_action, {})
		end,
	},
}
