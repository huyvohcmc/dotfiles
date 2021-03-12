local g = vim.g
local cmd = vim.cmd

local setup = function()
  cmd('colorscheme ci_dark')
  cmd('hi Normal guibg=NONE')
end

setup()
