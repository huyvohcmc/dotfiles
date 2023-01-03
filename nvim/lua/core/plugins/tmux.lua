return {
  'aserowy/tmux.nvim',
  event = 'VeryLazy',
  config = function()
    require('tmux').setup {
      navigation = {
        enable_default_keybindings = true,
      },
    }
  end,
}
