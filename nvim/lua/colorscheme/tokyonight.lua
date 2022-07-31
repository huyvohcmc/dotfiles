local g = vim.g
local api = vim.api

g.tokyonight_style = 'night'
g.tokyonight_sidebars = { 'qf', 'terminal', 'packer' }
g.tokyonight_dark_sidebar = true
g.tokyonight_dark_float = true

api.nvim_set_hl(0, 'LspDiagnosticsLineNrError', { fg = '#db4b4b', bg = '#3b4261' })
api.nvim_set_hl(0, 'LspDiagnosticsLineNrWarning', { fg = '#ff9e64', bg = '#3b4261' })

vim.cmd.colorscheme 'tokyonight'
