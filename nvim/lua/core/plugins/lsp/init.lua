local M = {
  'neovim/nvim-lspconfig',
  event = 'BufReadPre',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
}

function M.config()
  local lsp_defaults = {
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, bufnr)
      vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
    end,
  }

  local lspconfig = require 'lspconfig'

  lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

  -- Diagnostic customization
  local sign = function(opts)
    -- See :help sign_define()
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = opts.numhl,
    })
  end

  sign { name = 'DiagnosticSignError', text = '', numhl = 'LspDiagnosticsLineNrError' }
  sign { name = 'DiagnosticSignWarn', text = '', numhl = 'LspDiagnosticsLineNrWarning' }
  sign { name = 'DiagnosticSignHint', text = '', numhl = '' }
  sign { name = 'DiagnosticSignInfo', text = '', numhl = '' }

  vim.diagnostic.config {
    virtual_text = false,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

  -- Keybindings
  local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    group = group,
    desc = 'LSP actions',
    callback = function()
      local bufmap = function(mode, lhs, rhs)
        local opts = { buffer = true }
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
      bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
      bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
      bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
      bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
      bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
      bufmap('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
      bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
      bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
      bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
      bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
      bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
      bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end,
  })

  for _, server in ipairs {
    'solargraph',
  } do
    lspconfig[server].setup {}
  end

  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  }

  require('core.plugins.null-ls')
end

return M
