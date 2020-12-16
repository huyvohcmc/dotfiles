local g = vim.g
local cmd = vim.cmd

g.signify_vcs_list = { 'git' }
g.signify_realtime = 1
g.signify_sign_show_count = 0
g.signify_sign_change = '~'

cmd('hi! SignifySignChange guifg=#F7F6AF')
cmd('hi! SignifySignDelete guifg=#F7AFC0')
