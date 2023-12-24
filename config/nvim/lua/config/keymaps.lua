-- Exit insert mode
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- Enter -> add line
vim.keymap.set("n", "<CR>", "O<esc>", { noremap = true })

-- Save/Quit
vim.keymap.set("", "<C-Z>", ":update<CR>", { noremap = true })
vim.keymap.set("n", "<C-X>", ":quit<CR>", { noremap = true })

-- Beginning and end of line
vim.keymap.set("", "B", "0", { noremap = true })
vim.keymap.set("", "E", "$", { noremap = true })

-- Buffer navigation
vim.keymap.set("", "<C-h>", "<C-w>h", {})
vim.keymap.set("", "<C-j>", "<C-w>j", {})
vim.keymap.set("", "<C-k>", "<C-w>k", {})
vim.keymap.set("", "<C-l>", "<C-w>l", {})

-- Tabs
vim.keymap.set("", "<Leader>n", "<esc>:tabprevious<CR>", {})
vim.keymap.set("", "<Leader>m", "<esc>:tabnext<CR>", {})

-- Search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", {
  noremap = true
})

-- Visual mode indentation > < 
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
