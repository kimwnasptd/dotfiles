-- NOTE: We don't need to override the cmd path for the LSP servers to use the
-- ones installed by mason. mason.nvim adds to vim.env.PATH the bin path.

-- since helm_ls plugin uses treesitter for syntax highlighting, but also sets
-- the filetype to yaml.helm-values which treesitter doesn't have a parser for
-- https://github.com/qvalentin/helm-ls.nvim/blob/d6f3a8d4ad59b4f54cd734267dfb5411679ea608/ftdetect/filetype.lua#L8C27-L8C43
vim.treesitter.language.register("yaml", "yaml.helm-values")

-- Add neovim's runtime to the Lua LSP
local utils = require('lsp.utils')

vim.lsp.config["lua_ls"] = {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          utils.get_lua_runtime_path(),
        },
        telemetry = { enable = false },
      }
    }
  }
}

-- auto-completion
local on_attach = function(ev)
  local opts = { buffer = ev.buf }

  -- keymaps
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>i",
    ":lua vim.diagnostic.open_float(nil, {focus=true, scope=\"cursor\"})<CR>",
    opts
  )

  -- if native completion popup becomes good, don't rely on nvim-cmp
  -- https://neovim.io/doc/user/lsp.html#lsp-attach
  -- vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true, noremap = true })
  -- vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true, noremap = true })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_attach
})
