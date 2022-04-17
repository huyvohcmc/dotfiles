local lspconfig = require 'lspconfig'
local set = vim.keymap.set

local on_attach = function(client, bufnr)
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  })

  local opts = { buffer = bufnr }
  set('n', 'gD', vim.lsp.buf.declaration, opts)
  set('n', 'gd', vim.lsp.buf.definition, opts)
  set('n', 'gr', vim.lsp.buf.references, opts)
  set('n', 'gi', vim.lsp.buf.implementation, opts)
  set("n", "[d", vim.diagnostic.goto_prev, opts)
  set("n", "]d", vim.diagnostic.goto_next, opts)

  if client.resolved_capabilities.document_formatting then
    set('n', '<leader>f', vim.lsp.buf.formatting, opts)
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
