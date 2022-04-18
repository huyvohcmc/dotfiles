local api = vim.api

local window_resize_group = api.nvim_create_augroup('WindowResize', { clear = true })
api.nvim_create_autocmd('VimResized', { command = 'wincmd =', group = window_resize_group })
