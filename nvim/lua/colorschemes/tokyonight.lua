local api = vim.api

require('tokyonight').setup {
  style = 'night',
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    sidebars = 'dark',
    floats = 'dark',
  },
  sidebars = { 'qf', 'help', 'terminal', 'packer' }
}

api.nvim_set_hl(0, 'LspDiagnosticsLineNrError', { fg = '#db4b4b', bg = NONE })
api.nvim_set_hl(0, 'LspDiagnosticsLineNrWarning', { fg = '#ff9e64', bg = NONE })

vim.cmd.colorscheme 'tokyonight'
