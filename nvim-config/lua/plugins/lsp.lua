MASON_LSPCONFIG_SERVERS = { "lua_ls", "ruff", "pyright", "yamlls", "gopls@v0.17.1", "tflint", "bashls", "helm_ls" }
MASON_NON_LSP_SERVERS = { "black", "isort", "gofumpt" }

return {
  -- Install automatically predefined LSP servers
  {
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
  },
  -- Convert yaml type to helm, if in helm directory
  {
    "qvalentin/helm-ls.nvim",
    ft = "helm",
    opts = {},
  },
  -- Use nvim-cmp for the completion pop-up. The options will get filled by LSP and LuaSnip
  {
    "hrsh7th/nvim-cmp",
    commit = "d97d85e",
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp", commit = "cbc7b02"},
      {"L3MON4D3/LuaSnip", commit = "3732756"},
    },
    config = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end
  }
}
