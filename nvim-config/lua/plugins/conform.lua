vim.api.nvim_create_user_command(
  "DisableFormatting",
  function(_)
    vim.b.disable_autoformat = true
  end,
  { desc = "Disabled the auto-formatting on save." }
)

vim.api.nvim_create_user_command(
  "EnableeFormatting",
  function(_)
    vim.b.disable_autoformat = false
  end,
  { desc = "Enabled the auto-formatting on save." }
)

return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
      format_on_save = function(bufnr)
        if vim.b[bufnr].disable_autoformat then
          return
        end

        -- Format only if we haven't explicitly disabled formatting
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })
  end
}
