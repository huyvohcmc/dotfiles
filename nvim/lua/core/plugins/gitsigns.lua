local M = {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  cond = function()
    return vim.loop.fs_stat '.git'
  end,
}

function M.config()
  require('gitsigns').setup {
    signs = {
      add = { hl = 'GitSignsAdd', text = '▌', numhl = 'GitSignsAddNr' },
      change = { hl = 'GitSignsChange', text = '▌', numhl = 'GitSignsChangeNr' },
      delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr' },
      topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr' },
      changedelete = { hl = 'GitSignsChange', text = '▌', numhl = 'GitSignsChangeNr' },
    },
  }
end

return M
