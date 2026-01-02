-- Shortcuts:
--  S - open split (right)
--  s - open vsplit (down)
--  t - open in new tab
--  a - add file in current folder
--  d - delete
--  r - rename
--  y - copy to clipboard
--  x - cut to clipboard
--  p - paste
--  R - refresh
return {
  "nvim-neo-tree/neo-tree.nvim",
  tag = "3.38.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>.', ':Neotree filesystem toggle left<CR>', {})
    vim.keymap.set('n', '<leader>bf', ':Neotree buffers reveal float<CR>', {})
    vim.keymap.set('n', '<leader>gs', ':Neotree git_status toggle left<CR>', {})

    require("neo-tree").setup({
      -- Remove clear_filter mapping of C-x (use to quit)
      filesystem = {
        window = {
          mappings = {
            ["<C-x>"] = "noop",
           }
        },
      },
      -- Close neo-tree once a file is opened
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },

      }
    })
  end
}
