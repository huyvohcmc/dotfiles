local api = vim.api

local window_resize_group = api.nvim_create_augroup('WindowResize', { clear = true })
api.nvim_create_autocmd('VimResized', { command = 'wincmd =', group = window_resize_group })

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
