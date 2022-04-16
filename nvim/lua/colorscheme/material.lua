vim.g.material_style = "deep ocean"

require('material').setup({
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
    "terminal",
    "packer",
    "qf",
  },
  high_visibility = {
    darker = true,
  },
  disable = {
    borders = true,
    eob_lines = true,
  },
})

vim.cmd 'colorscheme material'
