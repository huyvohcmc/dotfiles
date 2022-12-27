local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
}

function M.config()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = 'tokyonight',
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
        },
      },
      lualine_x = { 'encoding', 'fileformat', 'searchcount', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree' },
  }
end

return M
