local lspconfig = require 'lspconfig'
local set = vim.keymap.set
local fn = vim.fn

-- Configure diagnostics displaying
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  update_in_insert = false,
  signs = true,
  severity_sort = true,
})

-- Highlight line numbers for diagnostics
fn.sign_define('DiagnosticSignError', { text = '', numhl = 'LspDiagnosticsLineNrError' })
fn.sign_define('DiagnosticSignWarn', { text = '', numhl = 'LspDiagnosticsLineNrWarning' })
fn.sign_define('DiagnosticSignInfo', { text = '' })
fn.sign_define('DiagnosticSignHint', { text = '' })

-- Change border of hover window
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
for _, server in ipairs {
  'gopls',
  'solargraph',
  'null-ls',
} do
  require('lsp.' .. server).setup(options)
end
