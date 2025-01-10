return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "python",
          "bash",
          "markdown",
          "markdown_inline",
          "vim",
          "vimdoc",
          "gitcommit",
          "gitignore",
          "go"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
