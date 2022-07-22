local null_ls = require 'null-ls'
local b = null_ls.builtins

local M = {}
M.setup = function(on_attach)
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
      b.diagnostics.golangci_lint,
      b.formatting.gofmt,
    },
    diagnostics_format = '#{m} [#{c}]',
    on_attach = on_attach,
  }
end

return M
