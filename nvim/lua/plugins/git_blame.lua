local g = vim.g
local api = vim.api

g.gitblame_enabled = 0
g.gitblame_date_format = '%d/%m/%Y'
g.gitblame_message_template = '<sha> • <summary> • <author> • <date>'

api.nvim_set_keymap('n', 'gb', ':GitBlameToggle<CR>', { noremap = true, silent = false })
