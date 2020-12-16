local M = {}

function M.setup()
  vim.g.equinusocio_material_style = 'pure'
  vim.cmd('colorscheme equinusocio_material')
  -- vim.cmd('hi! Normal guibg=NONE')
  -- vim.cmd('hi! Visual guibg=#9EC49F guifg=#050505')
  -- vim.cmd('hi! SignColumn guibg=NONE')
  -- vim.cmd('hi! StatusLine guifg=white')
  -- vim.cmd('hi! Comment guifg=#545454')
  -- vim.cmd('hi! VertSplit guibg=NONE')
end

return M
