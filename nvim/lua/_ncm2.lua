local api = vim.api

api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-N>" : "<Tab>"', { expr = true })
api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-P>" : "<S-Tab>"', { expr = true })

api.nvim_exec([[
augroup ncm2
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
]], '')
