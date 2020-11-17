local g = vim.g
local api = vim.api

g['sneak#label'] = 1
g['sneak#use_ic_scs'] = 1
g['sneak#absolute_dir'] = 1

api.nvim_set_keymap('', 'f', '<Plug>Sneak_s', { noremap = false })
api.nvim_set_keymap('', 'F', '<Plug>Sneak_S', { noremap = false })
api.nvim_set_keymap('', 't', '<Plug>Sneak_t', { noremap = false })
api.nvim_set_keymap('', 'T', '<Plug>Sneak_T', { noremap = false })
