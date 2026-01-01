-- https://dotfyle.com/neovim/colorscheme/top
return {
  "folke/tokyonight.nvim",
  dependencies = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'projekt0n/github-nvim-theme', name = 'github-theme' },
    { "navarasu/onedark.nvim", opts = { style = 'darker' }},
    "EdenEast/nightfox.nvim",
    'marko-cerovac/material.nvim',
    "Mofiqul/vscode.nvim",
    "rebelot/kanagawa.nvim",
    "NTBBloodbath/doom-one.nvim",
  },
  lazy = false,
  config = function()
    -- vim.cmd.colorscheme "catppuccin"
    -- vim.cmd.colorscheme "vscode"
    -- vim.cmd.colorscheme "kanagawa"
    -- vim.cmd.colorscheme "doom-one"
    -- require('onedark').load()
    vim.cmd("TNBrightLights")
    -- vim.cmd("TNZenBlueNight")
    -- vim.cmd("TNZenBlue")
  end
}
