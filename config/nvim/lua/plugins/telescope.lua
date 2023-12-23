-- https://github.com/nvim-telescope/telescope.nvim
-- C-x    Open in split
-- C-v    Open in vsplit
-- C-t    Open in tab
-- H/M/L  (N) high/midle/low
-- C-u    Scroll up Preview
-- C-d    Scroll down Preview
-- C-u    Scroll up Preview
-- C-d    Scroll down Preview
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
}
