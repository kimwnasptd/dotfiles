return {
  {
    "nvim-treesitter/nvim-treesitter",
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
          "helm"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
