local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
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

function autocmd.load_autocmds()
  local definitions = {
    bufs = {
      -- Automatically run :PackerCompile whenever plugins.lua is updated
      {"BufWritePost", "_plugins.lua", "PackerCompile"};
    };

    wins = {
      {"BufWinEnter,InsertEnter,InsertLeave", "*", [[tabdo match ExtraWhitespace /\s\+$/]]};
      {"BufWinLeave", "*", [[tabdo call clearmatches()]]};
      {"VimResized", "*", [[tabdo wincmd =]]};
      {"BufEnter", "*", [[tabdo call ncm2#enable_for_buffer()]]};
    };

    ft = {
      {"FileType", "c", "set shiftwidth=4"},
      {"FileType", "python", "set shiftwidth=4"},
      {"FileType", "go", "set shiftwidth=8"},
    };
  }

  autocmd.nvim_create_augroups(definitions)
end

return autocmd
