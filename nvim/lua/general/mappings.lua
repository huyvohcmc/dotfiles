local set = vim.keymap.set

set('n', '<leader>w', ':w<cr>', { silent = false })
set('n', '<leader>q', ':q<cr>', { silent = false })
set('n', '<leader>s', '<c-w>w', { silent = false })
set('n', 'j', 'gj')
set('n', 'k', 'gk')
set({'n', 'v'}, '<Tab>', '%')
