require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = false,
  term_colors = true,
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  no_italic = false,
  no_bold = true,
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    which_key = true,
    native_lsp = {
      enabled = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
}

vim.cmd.colorscheme 'catppuccin'
