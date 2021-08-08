require('hop').setup {}

vim.api.nvim_set_keymap("n", "s", ":HopChar1<CR>", { silent = true, noremap = false })
vim.api.nvim_set_keymap("n", "S", ":HopChar2<CR>", { silent = true, noremap = false })
