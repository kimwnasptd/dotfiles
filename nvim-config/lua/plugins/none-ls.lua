FORMATTING_AUGROUP = vim.api.nvim_create_augroup("LspFormatting", {})

-- Global for controlling if formatting should be enabled or disabled
NoneLsFormatting = true

vim.api.nvim_create_user_command(
  "DisableFormatting",
  function(_)
    NoneLsFormatting = false
  end,
  { desc = "Disabled the auto-formatting on save." }
)

vim.api.nvim_create_user_command(
  "EnableeFormatting",
  function(_)
    NoneLsFormatting = true
  end,
  { desc = "Enabled the auto-formatting on save." }
)

-- Run formatting tools on BugWritePre event via autocmd
ON_ATTACH_FN = function (client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = FORMATTING_AUGROUP, buffer = bufnr})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = FORMATTING_AUGROUP,
      buffer = bufnr,
      callback = function()
        if NoneLsFormatting then
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      end,
    })
  end
end

return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local sources = {
        formatting.black,
        formatting.isort,
        formatting.gofumpt,
      }

      null_ls.setup({
        on_attach = ON_ATTACH_FN,
        -- adds the sources as LSP servers to use on BufWritePre
        sources = sources,
      })
    end
  },
}
