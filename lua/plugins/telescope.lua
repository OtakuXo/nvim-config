return {
   "nvim-telescope/telescope.nvim",
   tag = "0.1.8",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {},
   config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<S-j>", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<S-k>", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<C-o>", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<C-h>", builtin.help_tags, { desc = "Telescope help tags" })

      vim.api.nvim_create_autocmd("VimEnter", {
         callback = function()
            if vim.fn.argv(0) == "" then
               require("telescope.builtin").find_files()
            end
         end,
      })
   end,
}
