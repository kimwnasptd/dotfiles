-- https://github.com/nvim-telescope/telescope.nvim
-- C-x        Open in split
-- C-v        Open in vsplit
-- C-t        Open in tab
-- H/M/L      (N) high/midle/low
-- C-u        Scroll up Preview
-- C-d        Scroll down Preview
-- C-u        Scroll up Preview
-- C-d        Scroll down Preview
-- leader-fg  Libe grep
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
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}
