set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua <<EOF
-- Disable Diagnostcs globally
require'lspconfig'.pyright.setup{}
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- require'lspconfig'.cssls.setup {
--   capabilities = capabilities,
-- }
EOF

