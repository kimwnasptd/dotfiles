local M = {}

function M.get_lua_runtime_path()
  -- keep only the first occurance of a path with nvim/runtime in it
  local runtime_paths = vim.api.nvim_list_runtime_paths()

  for _, path in ipairs(runtime_paths) do
    if path:match("nvim/runtime") then
      return path .. "/lua"
    end
  end
end

function M.get_mason_package_name(package)
  -- remove @ that includes the version
  local at_index = string.find(package, "@")

  if at_index then
    return string.sub(package, 1, at_index - 1)
  end

  return package
end

return M
