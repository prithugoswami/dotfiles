local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end


lspconfig.pyright.setup{}
