vim.g.material_style = 'deep ocean'

require('material').setup {
  contrast = {
    sidebars = true,
    floating_windows = true,
    line_numbers = true,
    sign_column = true,
    non_current_windows = true,
    popup_menu = true,
  },
  italics = {
    comments = true,
  },
  contrast_filetypes = {
    'packer',
    'qf',
  },
  disable = {
    borders = true,
    eob_lines = true,
  },
}

vim.api.nvim_command 'colorscheme material'
