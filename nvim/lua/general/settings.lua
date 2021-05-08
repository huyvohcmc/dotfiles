local o = vim.o
local bo = vim.bo
local wo = vim.wo
local fn = vim.fn
local api = vim.api
local g = vim.g

-- Skip providers
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Disable distribution plugins
g.loaded_gzip              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_zip               = 1
g.loaded_zipPlugin         = 1
g.loaded_getscript         = 1
g.loaded_getscriptPlugin   = 1
g.loaded_vimball           = 1
g.loaded_vimballPlugin     = 1
g.loaded_matchit           = 1
g.loaded_matchparen        = 1
g.loaded_2html_plugin      = 1
g.loaded_logiPat           = 1
g.loaded_rrhelper          = 1
g.loaded_netrwPlugin       = 1
g.loaded_netrwSettings     = 1
g.loaded_netrwFileHandlers = 1

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
}
-- Local to buffer
buffer_local = {
  expandtab = true;
  autoindent = true;
  tabstop = 2;
  shiftwidth = 2;
  softtabstop = -1;
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
