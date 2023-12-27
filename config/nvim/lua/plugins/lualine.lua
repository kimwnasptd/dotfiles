return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "dracula",
        theme = "auto",
      },
      sections = {
        lualine_b = { 'branch' },
        lualine_x = { 'diagnostics' },
        lualine_y = { '' },
        lualine_z = { '' },
      }
    })
  end
}
