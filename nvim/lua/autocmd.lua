local api = vim.api
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

function autocmd.setup()
  local definitions = {
    wins = {
      { 'VimResized', '*', 'wincmd =' },
      { 'BufWinEnter', '*', 'highlight ExtraWhitespace guifg=#666666' },
      { 'BufWinEnter', '*', [[match ExtraWhitespace /\s\+$/]] },
    };

    ft = {
      { 'FileType', 'c,python', 'set shiftwidth=4' },
      { 'FileType', 'go', 'set noexpandtab' },
      { 'FileType', 'go', 'set shiftwidth=4' },
      { 'FileType', 'go', 'set softtabstop=4' },
      { 'FileType', 'go', 'set tabstop=4' },
      { 'FileType', 'LuaTree', "lua vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>t', ':wincmd l | :Files<CR>', {})" },
    };
  }

  autocmd.nvim_create_augroups(definitions)
end

return autocmd
