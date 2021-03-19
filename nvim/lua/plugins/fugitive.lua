local api = vim.api

-- Vim-fugitive and vim-rhubarb
api.nvim_set_keymap('n', 'gb', ':Git blame<CR>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'ghub', ':Gbrowse<CR>', { noremap = true, silent = false })