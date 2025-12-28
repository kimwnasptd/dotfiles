# Configuring nvim

## Lazy

Lazy is the package manager I use for handling the nvim packages.

## Code Development
This will include instruction on how to setup LSP servers and linters.

### LSP with Mason
For LSP servers we'll use [mason](https://github.com/williamboman/mason.nvim) and
[mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim).

NOTE: This is only for LSP servers. Linters will need to be configured by a different
module.

Preferred Programmatic
1. Edit the `lsp.lua` file
2. Edit the `LOCAL_SERVERS` variable and add your server

Manual
1. Type `:Mason` to see the UI for LSP
2. Select your LSP and type `i` to install

Helpful commands
```
:LspInfo
:Mason
```

### Linters and Formatters

For linters we'll need to use the `non-ls` plugin.

To add a new linter/formatter
1. Edit `none-ls.lua` from dotfiles
2. Check the available linters in [BUILTINS](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
3. Add a line in the `sources` variable

### Useful Commands

```
:LspInfo
:Mason

-- https://github.com/nvim-telescope/telescope.nvim
C-x          Open in split
C-v          Open in vsplit
C-t          Open in tab
H/M/L        (N) high/midle/low
C-u          Scroll up Preview
C-d          Scroll down Preview
C-u          Scroll up Preview
C-d          Scroll down Preview
<leader>fg   Libe grep


```
