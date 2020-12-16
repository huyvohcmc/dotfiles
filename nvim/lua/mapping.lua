local g = vim.g
local api = vim.api
local mapping = {}

function mapping.setup()
  g.mapleader = ','
  api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>s', '<C-W>w', {noremap = true, silent = false})
  api.nvim_set_keymap('n', '<Leader>r', ':source $MYVIMRC<CR>', {noremap = true, silent = false})
  api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
  api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
  api.nvim_set_keymap('n', '<Tab>', '%', {noremap = true})
  api.nvim_set_keymap('v', '<Tab>', '%', {noremap = true})
end

return mapping
