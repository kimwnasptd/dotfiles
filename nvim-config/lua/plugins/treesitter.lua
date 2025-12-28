-- Using a deprecated version. Need to switch from master to main
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        build = ":TSUpdate",
        ensure_installed = {
          "python",
          "bash",
          "markdown",
          "markdown_inline",
          "vim",
          "vimdoc",
          "gitcommit",
          "gitignore",
          "go",
          "gotmpl",
          "helm",
          "lua",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
