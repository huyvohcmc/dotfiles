local null_ls = require 'null-ls'
local b = null_ls.builtins

local M = {}
M.setup = function(on_attach, capabilities)
  null_ls.setup {
    sources = {
      b.diagnostics.rubocop.with {
        command = 'bundle',
        args = vim.list_extend({ 'exec', 'rubocop' }, b.diagnostics.rubocop._opts.args),
      },
      b.formatting.rubocop.with {
        command = 'bundle',
        args = vim.list_extend({ 'exec', 'rubocop' }, b.formatting.rubocop._opts.args),
      },
      b.diagnostics.golangci_lint.with {
        filetypes = { 'go' },
      },
      b.formatting.gofmt.with {
        filetypes = { 'go' },
      },
    },
    diagnostics_format = '#{m} [#{c}]',
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

return M
