local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  })

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration)
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition)
  buf_set_keymap('n', 'gr', vim.lsp.buf.references)
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation)
  buf_set_keymap("n", "[d", vim.diagnostic.goto_prev)
  buf_set_keymap("n", "]d", im.diagnostic.goto_next)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<leader>f', vim.lsp.buf.formatting)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
}

lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
}

require 'lsp.null-ls'
