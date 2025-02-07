return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
      vim.keymap.set("n", "<leader>sf", builtin.live_grep, { desc = "Telescope: Search Files (Grep)" })
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Telescope: Search Old Files" })
      vim.keymap.set('n', "<leader>ts", ":Telescope colorscheme<CR>", { desc = "Telescope: Theme Selector" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
