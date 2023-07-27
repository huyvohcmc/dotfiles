local g = vim.g
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
opt.breakindent = true
opt.clipboard = 'unnamedplus'
opt.cmdheight = 0
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.copyindent = true
opt.cursorline = true
opt.expandtab = true
opt.history = 100
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.listchars = {
  eol = '¬',
  tab = '· ',
  trail = '·',
  nbsp = '⦸',
  extends = '»',
  precedes = '«',
}
opt.mouse = ''
opt.number = true
opt.preserveindent = true
opt.pumheight = 10
opt.scrolloff = 10
opt.shiftwidth = 2
opt.shortmess:append 'c'
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 500
opt.updatetime = 300
opt.writebackup = false
