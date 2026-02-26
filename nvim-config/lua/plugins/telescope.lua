return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0"}
    },
    config = function()
      local telescope = require('telescope')
      telescope.setup({})

      telescope.load_extension('fzf')
      telescope.load_extension("live_grep_args")

      -- keymaps like ctrlp
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

      -- live_grep (args)
      vim.keymap.set(
        "n",
        "<leader>fg",
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
    end
  },
}
