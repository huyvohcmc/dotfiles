local g = vim.g

g.gitblame_enabled = 0
g.gitblame_date_format = '%d/%m/%Y'
g.gitblame_message_template = ' <author>, <date> - <summary>'

vim.keymap.set('n', '<leader>gb', ':GitBlameToggle<cr>', { silent = false })
