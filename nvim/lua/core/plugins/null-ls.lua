local M = {
  'jose-elias-alvarez/null-ls.nvim',
}

function M.config()
  local nls = require 'null-ls'
  local diagnostics = nls.builtins.diagnostics
  local formatting = nls.builtins.formatting

  nls.setup {
    on_attach = function(client, bufnr)
      local bufcmd = vim.api.nvim_buf_create_user_command
      local format_cmd = function(input)
        vim.lsp.buf.format {
          id = client.id,
          async = input.bang,
        }
      end

      bufcmd(bufnr, 'NullFormat', format_cmd, {
        bang = true,
        range = true,
        desc = 'Format using null-ls',
      })

      vim.keymap.set({ 'n', 'x' }, '<leader>f', '<cmd>NullFormat!<cr>', {
        buffer = bufnr,
      })
    end,
    sources = {
      formatting.rubocop.with {
        command = 'bundle',
        args = vim.list_extend({ 'exec', 'rubocop' }, formatting.rubocop._opts.args),
      },
      formatting.stylua,
    },
  }
end

return M
