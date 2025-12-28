-- https://neovim.io/doc/user/lua-guide.html#lua-guide-options
vim.opt.encoding = "utf-8"
vim.opt.fileformats= { "unix", "dos", "mac" }
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard:prepend("unnamedplus")
vim.opt.backspace = { "indent", "eol", "start"}
vim.opt.smarttab = true
vim.opt.wrap = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.completeopt:append"noselect"
vim.opt.winborder = "rounded"
