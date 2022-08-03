local api = vim.api

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank { higroup = 'Substitute', timeout = 200 }
  end,
})
