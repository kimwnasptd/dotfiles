MASON_LSPCONFIG_SERVERS = { "lua_ls", "ruff", "pyright", "yamlls", "gopls", "tflint",
                            "bashls", "helm_ls", "terraformls" }
MASON_NON_LSP_SERVERS = { "black", "isort", "gofumpt" }

return {
  -- Install automatically predefined LSP servers
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
  },
  config = function()
    -- initialise mason-lspconfig
    require('mason-lspconfig').setup({ensure_installed = MASON_LSPCONFIG_SERVERS})

    -- install formatters and linters, that are not automatically installed
    local utils = require('lsp.utils')
    local installed_packages = require('mason-registry').get_installed_package_names()

    for _, package in ipairs(MASON_NON_LSP_SERVERS) do
      local package_name = utils.get_mason_package_name(package)

      if not vim.tbl_contains(installed_packages, package_name) then
        vim.cmd("MasonInstall " .. package)
      end
    end
  end
}
