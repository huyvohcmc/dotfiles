local null_ls = require('null-ls')

local M = {}

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local config = {
  on_attach = function(client, bufnr)
    local bufcmd = vim.api.nvim_buf_create_user_command
    local format_cmd = function(input)
      vim.lsp.buf.format({
        id = client.id,
        timeout_ms = 5000,
        async = input.bang,
      })
    end

    bufcmd(bufnr, 'NullFormat', format_cmd, {
      bang = true,
      range = true,
      desc = 'Format using null-ls'
    })

    vim.keymap.set({'n', 'x'}, '<leader>f', '<cmd>NullFormat!<cr>', {
      buffer = bufnr
    })
  end,
  sources = {
    diagnostics.rubocop.with {
      command = 'bundle',
      args = vim.list_extend({'exec', 'rubocop'}, diagnostics.rubocop._opts.args),
    },
    formatting.rubocop.with {
      command = 'bundle',
      args = vim.list_extend({'exec', 'rubocop'}, formatting.rubocop._opts.args),
    },
    diagnostics.golangci_lint,
    formatting.gofumpt,
  },
}

function M.setup()
  null_ls.setup(config)
end

return M
