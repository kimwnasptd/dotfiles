-- https://dotfyle.com/neovim/colorscheme/top
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight"

      -- import modules should have different color (blue)
      vim.api.nvim_set_hl(0, "@module", { fg = "#65BCFF" })

      -- async should be same as def (purple)
      vim.api.nvim_set_hl(0, "@keyword", { fg = "#C099FF" })

      -- variable members should be same as variables (white)
      vim.api.nvim_set_hl(0, "@variable.member", { fg = "#C8D3F5" })

      -- function parameters should be same as variables (white)
      vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#C8D3F5" })

      -- docstrings should be same as strings (green)
      vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#C3E88D" })

      -- class constructor should be the same as import and arg Type (blue)
      vim.api.nvim_set_hl(0, "@constructor", { fg = "#65BCFF" })
      vim.api.nvim_set_hl(0, "@Type", { fg = "#65BCFF" })

      -- docstrings (yellow)
      vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#FFC777" })

      -- self should be close with variable and function (cyan)
      vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#65BCFF" })
    end
  },
  {
    "EdenEast/nightfox.nvim",
  },
  {
    'marko-cerovac/material.nvim',
  },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
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
