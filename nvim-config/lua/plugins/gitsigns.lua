return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    local opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
      },
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "│" },
        topdelete = { text = "│" },
        changedelete = { text = "│" },
        untracked = { text = "│" },
      },
    }

    vim.keymap.set("n", "<Leader>gd", ":Gitsigns preview_hunk<CR>", {})
    vim.keymap.set("n", "<Leader>gbt", ":Gitsigns toggle_current_line_blame<CR>", {})
  end
}

