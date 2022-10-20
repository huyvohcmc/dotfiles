vim.g.material_style = 'deep ocean'

require('material').setup {
  contrast = {
    sidebars = false,
    non_current_windows = false,
    filetypes = {
      'packer',
      'qf',
    },
  },
  styles = {
    comments = { italic = true },
  },
  plugins = {
    'gitsigns',
    'hop',
    'indent-blankline',
    'nvim-cmp',
    'nvim-tree',
    'telescope',
    'which-key',
  },
  disable = {
    eob_lines = true,
  },
  lualine_style = 'default',
  async_loading = false,
  custom_highlights = {
    LspDiagnosticsLineNrError = {
      fg = '#F07178',
      bg = NONE,
    },
    LspDiagnosticsLineNrWarning = {
      fg = '#FFCB6B',
      bg = NONE,
    },
  },
}

vim.cmd.colorscheme 'material'
