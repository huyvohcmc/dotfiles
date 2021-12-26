local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = false })
set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = false })
set_keymap('n', '<Leader>s', '<C-W>w', { noremap = true, silent = false })
set_keymap('n', 'j', 'gj', { noremap = true })
set_keymap('n', 'k', 'gk', { noremap = true })
set_keymap('n', '<Tab>', '%', { noremap = true })
set_keymap('v', '<Tab>', '%', { noremap = true })
