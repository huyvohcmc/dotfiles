local command = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup('init_cmds', { clear = true })

autocmd('TextYankPost', {
  group = augroup,
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 100 }
  end,
})

autocmd('VimResized', {
  group = augroup,
  pattern = '*',
  command = 'wincmd =',
})

local hl_ns = vim.api.nvim_create_namespace 'hl_search'
local manage_hlsearch = function(char)
  if vim.fn.mode() == 'n' then
    local new_hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end
vim.on_key(manage_hlsearch, hl_ns)

command('Cppath', function()
  local path = vim.fn.expand '%'
  vim.fn.setreg('+', path)
end, {})
