local g = vim.g

g.ale_echo_msg_format = '%severity%: %linter%: %s'
g.ale_set_highlights = 0
g.ale_lint_on_insert_leave = 0
g.ale_ruby_rubocop_executable = 'bundle'
g.ale_linters = {
  ruby = {'rubocop'},
  javascript = {'eslint', 'prettier'}
}
g.ale_fixers = {
  ruby = {'rubocop'},
  javascript = {'prettier'}
}

vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>(ale_fix)', { noremap = false, silent = false })
