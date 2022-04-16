local g = vim.g

g.gitblame_enabled = 0
g.gitblame_date_format = '%d/%m/%Y'
g.gitblame_message_template = '<sha> • <summary> • <author> • <date>'

vim.keymap.set('n', 'gb', ':GitBlameToggle<cr>', { silent = false })
