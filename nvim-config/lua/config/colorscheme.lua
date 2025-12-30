local setCommonSettings = function()
  vim.cmd.colorscheme "tokyonight"

  -- async should be same as def (purple)
  vim.api.nvim_set_hl(0, "@keyword", { fg = "#C099FF" })

  -- variable members and func params should be same as variables (white)
  vim.api.nvim_set_hl(0, "@variable.member", { fg = "#C8D3F5" })
  vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#C8D3F5" })

  -- docstrings (yellow)
  vim.api.nvim_set_hl(0, "@string.documentation", { fg = "#FFC777" })
end

local zenBlueFn = function()
  setCommonSettings()

  -- import modules, class constructors, func arg types (blue)
  vim.api.nvim_set_hl(0, "@module", { fg = "#65BCFF" })
  vim.api.nvim_set_hl(0, "@constructor", { fg = "#65BCFF" })
  vim.api.nvim_set_hl(0, "@Type", { fg = "#65BCFF" })
end

local brightLightsFn = function()
  setCommonSettings()

  -- import modules, class constructors, func arg types (red)
  vim.api.nvim_set_hl(0, "@module", { fg = "#FF757F" })
  vim.api.nvim_set_hl(0, "@constructor", { fg = "#FF757F" })
  vim.api.nvim_set_hl(0, "@type", { fg = "#FF757F" })

  -- self same as def (purple)
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#C099FF" })
end

local zenBlueNightFn = function()
  zenBlueFn()

  -- self same as def (purple)
  vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#C099FF" })
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

