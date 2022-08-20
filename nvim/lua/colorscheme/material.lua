vim.g.material_style = 'deep ocean'

require('material').setup {
  contrast = {
    sidebars = false,
    -- floating_windows = true,
  },
  italics = {
    comments = true,
  },
  contrast_filetypes = {
    'packer',
    'qf',
  },
  disable = {
    -- borders = true,
    eob_lines = true,
  },
}

vim.api.nvim_set_hl(0, 'LspDiagnosticsLineNrError', { fg = '#F07178', bg = NONE })
vim.api.nvim_set_hl(0, 'LspDiagnosticsLineNrWarning', { fg = '#FFCB6B', bg = NONE })

vim.cmd.colorscheme 'material'
