return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- custom theme
      local pickers = {
        find_files = {
          theme = "dropdown",
        }
      }

      require('telescope').setup{
        pickers = pickers,
      }

      -- keymaps like ctrlp
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
}
