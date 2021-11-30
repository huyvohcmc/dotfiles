require("gitlinker").setup({
  mappings = nil,
})

vim.api.nvim_set_keymap('n', 'gl', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
vim.api.nvim_set_keymap('v', 'gl', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})
