local white_msg = "#BFC9F5"
local white_text = "#C8D3F5"
local yellow = "#FFC777"
local purple = "#C099FF"
local deep_blue = "#65BCFF"
local red = "#FF757F"

local setCommonSettings = function()
  vim.cmd.colorscheme "tokyonight"

  -- whitter text
  vim.api.nvim_set_hl(0, "MsgArea", { fg = white_msg })
  vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = white_msg })
  -- async should be same as def
  vim.api.nvim_set_hl(0, "@keyword", { fg = purple })

  -- variable members and func params should be same as variables
  vim.api.nvim_set_hl(0, "@variable.member", { fg = white_text })
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = white_text })

  -- docstrings (yellow)
  vim.api.nvim_set_hl(0, "@string.documentation", { fg = yellow })
end

local zenBlueFn = function()
  setCommonSettings()

  -- import modules, class constructors, func arg types
  vim.api.nvim_set_hl(0, "@module", { fg = deep_blue })
  vim.api.nvim_set_hl(0, "@constructor", { fg = deep_blue })
  vim.api.nvim_set_hl(0, "@Type", { fg = deep_blue })
end

local brightLightsFn = function()
  setCommonSettings()

  -- import modules, class constructors, func arg types
  vim.api.nvim_set_hl(0, "@module", { fg = red })
  vim.api.nvim_set_hl(0, "@constructor", { fg = red })
  vim.api.nvim_set_hl(0, "@type", { fg = red })

  -- self same as def
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = purple })
end

local zenBlueNightFn = function()
  zenBlueFn()

  -- self same as def
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = purple })
end

-- Custom User Commands for TokyoNight themes
vim.api.nvim_create_user_command(
  "TNZenBlue",
  function(_) zenBlueFn() end,
  { desc = "Install TokyoNight Zen Blue theme." }
)

vim.api.nvim_create_user_command(
  "TNZenBlueNight",
  function(_) zenBlueNightFn() end,
  { desc = "Install TokyoNight Zen Blue Night theme." }
)

vim.api.nvim_create_user_command(
  "TNBrightLights",
  function(_) brightLightsFn() end,
  { desc = "Install TokyoNight Bright Lights theme." }
)

