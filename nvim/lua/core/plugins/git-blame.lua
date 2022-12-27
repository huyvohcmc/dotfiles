vim.g.gitblame_enabled = 0
vim.g.gitblame_date_format = '%d/%m/%Y'
vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<cr>', { silent = false })

return {
  'f-person/git-blame.nvim',
  event = 'BufReadPre',
}
