local M = {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPost', 'BufNewFile' },
}

function M.config()
  require('ibl').setup {
    exclude = {
      filetypes = {
        'help',
        'dashboard',
        'NvimTree',
      },
      buftypes = {
        'nofile',
        'terminal',
        'lspinfo',
      },
    },
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = {
      enabled = false,
    },
  }
end

return M
