local M = {
  'catppuccin/nvim',
  lazy = true,
  priority = 1000,
}

function M.config()
  require('catppuccin').setup {
    flavour = 'mocha',
    background = {
      dark = 'mocha',
    },
    no_bold = true,
    styles = {
      conditionals = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      mini = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      lightspeed = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
      },
      treesitter = true,
      which_key = true,
    },
  }

  vim.api.nvim_set_hl(0, 'LspDiagnosticsLineNrError', { fg = '#F38BA8', bg = NONE })
  vim.api.nvim_set_hl(0, 'LspDiagnosticsLineNrWarning', { fg = '#FAB387', bg = NONE })

  vim.cmd.colorscheme 'catppuccin'
end

return M
