vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-N>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-P>" : "<S-Tab>"', { expr = true })
