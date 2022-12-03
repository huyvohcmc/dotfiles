local g = vim.g
local o = vim.o
local opt = vim.opt

-- Skip providers
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

-- Disable distribution plugins
g.zipPlugin = 0
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.highlighturl_enabled = 1
g.load_black = 0
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_remote_plugins = 1

-- Options
o.completeopt = 'menuone,noselect'
o.hidden = true
o.incsearch = true
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.lazyredraw = true
o.list = true
o.backup = false
o.writebackup = false
o.showmode = false
o.swapfile = false
o.scrolloff = 5
o.splitright = true
o.tags = './tags;,tags'
o.ttimeoutlen = 10
o.wildignorecase = true
o.wildignore =
  '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
o.termguicolors = true
o.number = true
o.laststatus = 3
o.cmdheight = 0
o.history = 100
o.signcolumn = 'yes'
o.pumheight = 10
o.updatetime = 300
o.expandtab = true
o.autoindent = true
o.copyindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.breakindent = true
o.preserveindent = true
o.mouse = ''

opt.listchars = {
  eol = '¬',
  tab = '· ',
  trail = '·',
  nbsp = '⦸',
  extends = '»',
  precedes = '«',
}
opt.shortmess:append 'c'
opt.clipboard:append 'unnamedplus'
