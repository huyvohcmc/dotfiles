local options = setmetatable({}, { __index = { global_local = {}, buffer_local = {}, window_local = {} } })

function options:load_options()
  -- Global
  self.global_local = {
    clipboard = 'unnamedplus';
    completeopt = 'noinsert,menuone,noselect';
    hidden = true;
    incsearch = true;
    hlsearch = true;
    ignorecase = true;
    smartcase = true;
    lazyredraw = true;
    list = true;
    listchars = 'tab:>·,nbsp:+,trail:·,extends:→,precedes:←';
    matchpairs = '(:),{:},[:],<:>';
    backup = false;
    writebackup = false;
    showmode = false;
    swapfile = false;
    scrolloff = 5;
    shortmess = 'aoOTIcF';
    splitright = true;
    tags = './tags;,tags';
    ttimeoutlen = 0;
    wildignore = 'tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store';
    wildmode = 'longest:full,list,full';
    termguicolors = true;
    expandtab = true;
    shiftwidth = 2;
    softtabstop = -1;
    copyindent = true;
  }
  -- Local to buffer
  self.buffer_local = {
    expandtab = true;
    shiftwidth = 2;
    softtabstop = -1;
    copyindent = true;
  }
  -- Local to window
  self.window_local = {
    signcolumn = 'yes';
    linebreak = true;
  }

  for name, value in pairs(self.global_local) do
    vim.o[name] = value
  end
  for name, value in pairs(self.buffer_local) do
    vim.bo[name] = value
  end
  for name, value in pairs(self.window_local) do
    vim.wo[name] = value
  end

  if vim.fn.has('vim_starting') == 1 then
    vim.api.nvim_command('syntax enable')
  end
end

return options
