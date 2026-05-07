local M = {}
local utils = require 'gitstuff.utils'

M.sh_cmd = function(command)
  local cwd = vim.fn.expand '%:p:h'
  vim.system({ 'git', 'log' }, { cwd = cwd, text = true }, function(o)
    print(o.stdout)
  end)
end

local function git(cwd, args)
  local result = vim.system(vim.list_extend({ 'git', '-C', cwd }, args), { text = true }):wait()
  if result.code ~= 0 then
    return nil
  end
  return vim.trim(result.stdout or '')
end

local function remote_to_https(url)
  url = url:gsub('%.git$', '')
  local host, path = url:match '^git@([^:]+):(.+)$'
  if host then
    return 'https://' .. host .. '/' .. path
  end
  host, path = url:match '^ssh://git@([^/]+)/(.+)$'
  if host then
    return 'https://' .. host .. '/' .. path
  end
  return url
end

M.copy_line_url = function(visual)
  local filepath = utils.get_filepath()
  if not filepath then
    vim.notify('No file in current buffer', vim.log.levels.WARN)
    return
  end
  filepath = vim.fs.normalize(filepath)
  local cwd = vim.fn.fnamemodify(filepath, ':h')

  local s, e
  if visual then
    s, e = vim.fn.line "'<", vim.fn.line "'>"
  else
    s = vim.fn.line '.'
    e = s
  end
  if s > e then
    s, e = e, s
  end

  local root = git(cwd, { 'rev-parse', '--show-toplevel' })
  if not root or root == '' then
    vim.notify('Not in a git repository', vim.log.levels.WARN)
    return
  end
  root = vim.fs.normalize(root)

  local ref = git(cwd, { 'symbolic-ref', '--quiet', '--short', 'HEAD' })
  if not ref or ref == '' then
    ref = git(cwd, { 'rev-parse', 'HEAD' })
  end
  if not ref or ref == '' then
    vim.notify('Could not determine git ref', vim.log.levels.WARN)
    return
  end

  local remote = git(cwd, { 'config', '--get', 'remote.origin.url' })
  if not remote or remote == '' then
    vim.notify('No remote.origin.url configured', vim.log.levels.WARN)
    return
  end

  if filepath:sub(1, #root + 1) ~= root .. '/' then
    vim.notify('File is outside the git repo', vim.log.levels.WARN)
    return
  end
  local rel = filepath:sub(#root + 2)

  local frag = s == e and string.format('#L%d', s) or string.format('#L%d-L%d', s, e)
  local url = string.format('%s/blob/%s/%s%s', remote_to_https(remote), ref, rel, frag)

  vim.fn.setreg('+', url)
  vim.fn.setreg('"', url)
  vim.notify('Copied: ' .. url)
end

return M
