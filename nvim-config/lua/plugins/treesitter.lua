local parsers = { 'yaml', 'helm', 'python', 'bash', 'markdown_inline', 'vim',
                  'gitcommit', 'gitcommit', 'go', 'gotmpl', 'lua', 'toml' }

-- Using a deprecated version. Need to switch from master to main
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  config = function()
    local opts = {
      lazy = false,
      build = ':TSUpdate',
    }
    local treesitter = require('nvim-treesitter')
    treesitter.setup(opts)

    -- install parsers, if not already installed
    local installedParsers = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim.iter(parsers)
      :filter(function(parser) return not vim.tbl_contains(installedParsers, parser) end)
      :totable()

    treesitter.install(parsersToInstall)

    -- start treesitter when an expected filetype is opened
    local group = vim.api.nvim_create_augroup('MyTreesitterSetup', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = parsers,
      callback = function(args)
        -- Enable highlighting for the buffer
        vim.treesitter.start(args.buf)

        -- Enable indentation for the buffer
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- custom filetype to parser mappings
    vim.treesitter.language.register('yaml', 'yaml.helm-values')
  end
}
