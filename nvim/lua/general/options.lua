local g = vim.g
local opt = vim.opt

-- Skip providers
g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Disable distribution plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit'
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

opt.completeopt = 'menuone,noselect';
opt.hidden = true;
opt.incsearch = true;
opt.hlsearch = true;
opt.ignorecase = true;
opt.smartcase = true;
opt.lazyredraw = true;
opt.list = true;
opt.listchars = 'tab:· ,nbsp:+,trail:·,extends:→,precedes:←';
opt.matchpairs = '(:),{:},[:],<:>';
opt.backup = false;
opt.writebackup = false;
opt.showmode = false;
opt.swapfile = false;
opt.scrolloff = 5;
opt.shortmess = 'filnxtToOFc';
opt.splitright = true;
opt.tags = './tags;,tags';
opt.ttimeoutlen = 0;
opt.wildignore = 'tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store';
opt.wildmode = 'longest:full,list,full';
opt.termguicolors = true;
opt.clipboard = 'unnamedplus';
opt.expandtab = true;
opt.autoindent = true;
opt.tabstop = 2;
opt.shiftwidth = 2;
opt.softtabstop = -1;
opt.linebreak = true;
opt.signcolumn = 'yes';
