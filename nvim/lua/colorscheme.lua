local base16 = require 'base16'
base16(base16.themes.onedark, true)
vim.cmd('hi! Normal guibg=NONE')
vim.cmd('hi! VertSplit guibg=NONE')
vim.cmd('hi! StatusLine guifg=#dcdfe4')

-- SignColumn
vim.cmd('hi! SignColumn guibg=NONE')
vim.cmd('hi! SignifySignAdd guibg=NONE')
vim.cmd('hi! SignifySignChange guibg=NONE')
vim.cmd('hi! SignifySignDelete guibg=NONE')
vim.cmd('hi! link GitSignsAdd SignifySignAdd')
vim.cmd('hi! link GitSignsChange SignifySignChange')
vim.cmd('hi! link GitSignsDelete SignifySignDelete')
