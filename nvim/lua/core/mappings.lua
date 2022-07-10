local set = vim.keymap.set

set('n', '<leader>w', ':w<cr>', { silent = false })
set('n', '<leader>q', ':q<cr>', { silent = false })
set('n', '<leader>s', '<c-w>w', { silent = false })
set({ 'n', 'v' }, '<Tab>', '%')

set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
