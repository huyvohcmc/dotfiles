local api = vim.api

local function nvim_create_augroup(group_name, definitions)
  api.nvim_command('augroup ' .. group_name)
  api.nvim_command('autocmd!')
  for _, def in ipairs(definitions) do
    local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
    api.nvim_command(command)
  end
  api.nvim_command('augroup END')
end


local definitions = {
  wins = {
    { 'VimResized', '*', 'wincmd =' },
    { 'BufWinEnter', '*', 'highlight ExtraWhitespace guifg=#666666' },
    { 'BufWinEnter', '*', [[match ExtraWhitespace /\s\+$/]] },
    { 'VimEnter', '*', "if bufname('%') == '' | IndentLinesDisable | endif" },
  };

  ft = {
    { 'FileType', 'c,python', 'set shiftwidth=4' },
    { 'FileType', 'go', 'set noexpandtab' },
    { 'FileType', 'go', 'set shiftwidth=4' },
    { 'FileType', 'go', 'set softtabstop=4' },
    { 'FileType', 'go', 'set tabstop=4' },
  };
}

nvim_create_augroup('autocmd', definitions)


