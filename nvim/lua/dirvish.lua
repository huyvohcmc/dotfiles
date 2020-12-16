vim.g.dirvish_mode = ":sort ,^.*[/],"
vim.g.dirvish_git_indicators = {
  Modified = '✗',
  Staged = '✓',
  Untracked = '★',
  Renamed = '➜',
  Unmerged = ' ',
  Ignored = '☒',
  Unknown = '?'
}

vim.cmd('command! -nargs=? -complete=dir Explore Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>')
