local M = {}
local utils = require 'gitstuff.utils'

M.sh_cmd = function(command)
  local cwd = vim.fn.expand '%:p:h'
  vim.system({ 'git', 'log' }, { cwd = cwd, text = true }, function(o)
    print(o.stdout)
  end)
end

return M
