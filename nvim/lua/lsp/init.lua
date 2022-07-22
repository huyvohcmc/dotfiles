local lspconfig = require 'lspconfig'
local set = vim.keymap.set

-- Highlight line numbers for diagnostics
vim.fn.sign_define('DiagnosticSignError', { numhl = 'LspDiagnosticsLineNrError', text = '' })
vim.fn.sign_define('DiagnosticSignWarn', { numhl = 'LspDiagnosticsLineNrWarning', text = '' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '' })
vim.fn.sign_define('DiagnosticSignHint', { text = '' })

-- Configure diagnostics displaying
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  set('n', 'gd', vim.lsp.buf.definition, opts)
  set('n', 'gD', vim.lsp.buf.declaration, opts)
  set('n', 'gr', vim.lsp.buf.references, opts)
  set('n', 'gi', vim.lsp.buf.implementation, opts)
  set('n', 'K', vim.lsp.buf.hover, opts)

  set('n', '[g', function()
    vim.diagnostic.goto_prev { float = { border = 'rounded' } }
  end, opts)
  set('n', ']g', function()
    vim.diagnostic.goto_next { float = { border = 'rounded' } }
  end, opts)
  set('n', '<leader>d', function()
    vim.diagnostic.open_float(0, { scope = 'line', border = 'rounded' })
  end)

  if client.supports_method 'textDocument/formatting' then
    set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, server in ipairs {
  'null-ls',
  'gopls',
  'solargraph',
} do
  require('lsp.' .. server).setup(on_attach, capabilities)
end
