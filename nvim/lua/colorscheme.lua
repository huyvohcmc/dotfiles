local g = vim.g
local cmd = vim.cmd

local setup = function()
  g.equinusocio_material_style = 'pure'
  cmd('colorscheme equinusocio_material')
end

setup()
