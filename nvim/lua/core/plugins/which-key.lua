return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = { vim.g.icons_enabled and '' or '+', separator = '' },
  },
  config = function(_, opts)
    require('which-key').setup(opts)
  end,
}
