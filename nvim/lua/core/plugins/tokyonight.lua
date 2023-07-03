return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local api = vim.api
    local tokyonight = require 'tokyonight'
    tokyonight.setup {
      style = 'night',
      styles = {
        keywords = {},
      },
      sidebars = { 'qf', 'terminal', 'startuptime' },
      on_highlights = function(hl, c)
        local prompt = '#2d3149'
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      end,
    }
    api.nvim_set_hl(0, 'LspDiagnosticsLineNrError', { fg = '#db4b4b', bg = NONE })
    api.nvim_set_hl(0, 'LspDiagnosticsLineNrWarning', { fg = '#ff9e64', bg = NONE })
    tokyonight.load()
  end,
}
