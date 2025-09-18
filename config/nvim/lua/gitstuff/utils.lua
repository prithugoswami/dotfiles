local M = {}

M.get_filepath = function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == '' then
    return nil
  end
  if filepath:match '^term://' then
    return nil
  end
  return filepath
end

return M
