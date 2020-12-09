local M = {}

function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function M.setup()
  local definitions = {
    bufs = {
      -- Automatically run :PackerCompile whenever plugins.lua is updated
      { 'BufWritePost', '_plugins.lua', 'PackerCompile' },
    };

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

  M.nvim_create_augroups(definitions)
end

return M
