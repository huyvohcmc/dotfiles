local o = vim.o
local bo = vim.bo
local wo = vim.wo
local fn = vim.fn
local api = vim.api
local options = setmetatable({}, { __index = { global_local = {}, buffer_local = {}, window_local = {} } })

function options.setup()
  -- Global
  global_local = {
    completeopt = 'menuone,noselect';
    hidden = true;
    incsearch = true;
    hlsearch = true;
    ignorecase = true;
    smartcase = true;
    lazyredraw = true;
    list = true;
    listchars = 'tab:· ,nbsp:+,trail:·,extends:→,precedes:←';
    matchpairs = '(:),{:},[:],<:>';
    backup = false;
    writebackup = false;
    showmode = false;
    swapfile = false;
    scrolloff = 5;
    shortmess = 'filnxtToOFc';
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
  buffer_local = {
    expandtab = true;
    shiftwidth = 2;
    softtabstop = -1;
    copyindent = true;
  }
  -- Local to window
  window_local = {
    signcolumn = 'auto';
    linebreak = true;
  }

  for name, value in pairs(global_local) do
    o[name] = value
  end
  for name, value in pairs(buffer_local) do
    bo[name] = value
  end
  for name, value in pairs(window_local) do
    wo[name] = value
  end

  if fn.has('vim_starting') == 1 then
    api.nvim_command('syntax enable')
  end
end

return options
