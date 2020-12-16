local g = vim.g
local cmd = vim.cmd

g.dirvish_mode = ":sort ,^.*[/],"
g.dirvish_git_indicators = {
  Modified = '✗',
  Staged = '✓',
  Untracked = '★',
  Renamed = '➜',
  Unmerged = ' ',
  Ignored = '☒',
  Unknown = '?'
}

cmd('command! -nargs=? -complete=dir Explore Dirvish <args>')
cmd('command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>')
cmd('command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>')
