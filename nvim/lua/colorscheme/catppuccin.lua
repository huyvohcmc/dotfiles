local catppuccin = require("catppuccin")

catppuccin.setup({
  transparent_background = false,
  term_colors = false,
  styles = {
    conditionals = "NONE",
    keywords = "italic",
  },
  integrations = {
    lsp_trouble = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = false,
    },
    dashboard = false,
    bufferline = false,
    markdown = false,
    lightspeed = true,
    notify = false,
    telekasten = false,
    symbols_outline = false,
  },
})

vim.g.catppuccin_flavour = "mocha"
vim.cmd[[colorscheme catppuccin]]
