-- https://dotfyle.com/neovim/colorscheme/top
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme "tokyonight"
    end
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
          style = 'darker'
      }
      -- require('onedark').load()
    end
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      -- vim.cmd.colorscheme "vscode"
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      -- vim.cmd.colorscheme "kanagawa"
    end
  },
  {
    "NTBBloodbath/doom-one.nvim",
    config = function()
      -- vim.cmd.colorscheme "doom-one"
    end
  }
}
