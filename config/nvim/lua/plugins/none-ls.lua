FORMATTING_AUGROUP = vim.api.nvim_create_augroup("LspFormatting", {})

ON_ATTACH_FN = function (client, bufnr)
  -- Run formatters on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = FORMATTING_AUGROUP, buffer = bufnr})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = FORMATTING_AUGROUP,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local sources = {
        diagnostics.flake8,
        formatting.isort,
        formatting.autopep8,
      }

      null_ls.setup({
        on_attach = ON_ATTACH_FN,
        sources = sources,
      })
    end
  },
}
