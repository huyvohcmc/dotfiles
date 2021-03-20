vim.g.gitblame_enabled = 0

vim.api.nvim_set_keymap('n', 'gb', ':GitBlameToggle<CR>', { noremap = true, silent = false })
