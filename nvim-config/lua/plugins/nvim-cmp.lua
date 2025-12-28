return {
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
      local minuet = require('minuet')

      local mappings = {
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
      }

      local snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      local sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }

      cmp.setup {
        snippet = snippet,
        mapping = cmp.mapping.preset.insert(mappings),
        sources = sources,
      }
    end
  }
}
