return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '¬',
          accept_word = false,
          accept_line = false,
          next = '∆',
          prev = '˚',
          dismiss = '<C-]>',
        },
      },
      panel = {
        enabled = false,
      },
    })

    require('copilot_cmp').setup()
  end
}
