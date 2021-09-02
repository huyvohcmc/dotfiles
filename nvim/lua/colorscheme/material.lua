vim.g.material_style = "deep ocean"

require('material').setup {
  contrast = true,
  borders = true,
  italics = {
    comments = true,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
  },

  contrast_windows = {
    "terminal",
    "packer",
  },

  text_contrast = {
    lighter = true,
    darker = false,
  },
}

vim.cmd[[colorscheme material]]
