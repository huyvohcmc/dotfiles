return {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {
      show_help = false,
      triggers = 'auto',
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      window = {
        border = 'rounded',
        padding = { 2, 2, 2, 2 },
      },
    }
  end,
}
