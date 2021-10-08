local function rubocop()
  return {
    exe = 'bundle exec rubocop',
    args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', "awk 'f; /^====================$/{f=1}'"},
    stdin = true,
  }
end

require('formatter').setup {
  logging = false,
  filetype = {
    ruby = { rubocop },
  },
}

vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Format<cr>', { silent = true })
