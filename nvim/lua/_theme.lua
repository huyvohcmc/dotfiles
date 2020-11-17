local theme = {}

function theme:load_colorscheme()
  vim.cmd('colorscheme mountaineer')

  vim.cmd('hi! Visual guibg=#9EC49F guifg=#050505')
  vim.cmd('hi! SignColumn guibg=NONE')
  vim.cmd('hi! StatusLine guifg=white')
  vim.cmd('hi! Comment guifg=#545454')
  vim.cmd('hi! VertSplit guibg=NONE')
  vim.cmd('hi! Normal guibg=NONE')
  vim.cmd('hi! ExtraWhitespace guifg=#666666')
end

return theme
