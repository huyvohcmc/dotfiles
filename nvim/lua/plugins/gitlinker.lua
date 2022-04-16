require'gitlinker'.setup {
  mappings = nil,
}

vim.keymap.set('n', 'gl', function()
  require'gitlinker'.get_buf_range_url('n', {action_callback = require'gitlinker.actions'.open_in_browser})
end)

vim.keymap.set('v', 'gl', function()
  require'gitlinker'.get_buf_range_url('v', {action_callback = require"gitlinker.actions".open_in_browser})
end)
