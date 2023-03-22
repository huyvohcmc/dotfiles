return {
  'NvChad/nvim-colorizer.lua',
  event = 'BufReadPre',
  config = function()
    require('colorizer').setup {
      user_default_options = {
        names = false,
      },
    }
  end,
}
