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

-- Handle formatting in a smarter way
vim.lsp.handlers['textDocument/formatting'] = function(err, result, ctx, _)
  if err ~= nil or result == nil then
    return
  end

  -- If the buffer hasn't been modified before the formatting has finished,
  -- update the buffer
  if not vim.api.nvim_buf_get_option(ctx.bufnr, 'modified') then
    local view = vim.fn.winsaveview()
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
    vim.fn.winrestview(view)
    if ctx.bufnr == vim.api.nvim_get_current_buf() or not ctx.bufnr then
      vim.api.nvim_command 'noautocmd :update'
    end
  end
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'rounded',
})

local on_attach = function(client, bufnr)
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

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
