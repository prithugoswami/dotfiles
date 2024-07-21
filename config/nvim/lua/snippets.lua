local snip_status_ok, ls = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

local get_title = function(nodes)
  local url = nodes[1][1]
  vim.notify('Url: ' .. url)
  local out = ''
  local jobid = vim.fn.jobstart({ 'fetchtitle', url }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        print(vim.inspect(data))
        out = data[1]
      end
    end,
  })
  vim.fn.jobwait({ jobid }, 3000)
  return out
end

ls.add_snippets('markdown', {
  s(
    'mdlink',
    fmt('[{}]({})', {
      f(get_title, { 1 }),
      i(1),
    })
  ),
  s(
    'll',
    fmt('#### {}', {
      f(function()
        return os.date '%Y-%m-%d %H:%M'
      end),
    })
  ),
})
