return {
   { "hrsh7th/cmp-nvim-lsp" },
   {
      "L3MON4D3/LuaSnip",
      dependencies = {
         "saadparwaiz1/cmp_luasnip",
         "rafamadriz/friendly-snippets",
      },
   },
   {
      "hrsh7th/nvim-cmp",
      config = function()
         local cmp = require("cmp")
         require("luasnip.loaders.from_vscode").lazy_load()

         cmp.setup({
            snippet = {
               expand = function(args)
                  require("luasnip").lsp_expand(args.body)
                  vim.snippet.expand(args.body)
               end,
            },

            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
               ["<C-Space>"] = cmp.mapping.complete(),
               ["<C-j>"] = cmp.mapping.scroll_docs(),
               ["<C-k>"] = cmp.mapping.open_docs(),
               ["<Enter>"] = cmp.mapping.confirm(),
               ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_next_item()
                  elseif require("luasnip").expand_or_jumpable() then
                     vim.fn.feedkeys(
                        vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                        ""
                     )
                  else
                     fallback()
                  end
               end, {
                  "i",
                  "s",
               }),
               ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                     cmp.select_prev_item()
                  else
                     fallback()
                  end
               end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "luasnip" },
            }, {
               { name = "buffer" },
            }),
         })
      end,
   },
}
