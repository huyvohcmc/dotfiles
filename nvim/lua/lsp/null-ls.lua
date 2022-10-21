local null_ls = require 'null-ls'
local b = null_ls.builtins

local M = {}
M.setup = function(options)
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
    diagnostics_format = "[#{c}] #{m} (#{s})",
    on_attach = options.on_attach,
    flags = options.flags,
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".nvim.settings.json", ".git"),
  }
end

return M
