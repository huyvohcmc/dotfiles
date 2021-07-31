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

opt.termguicolors = true
opt.completeopt = 'menuone,noselect'
opt.hidden = true
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.lazyredraw = true
opt.list = true
opt.listchars = 'tab:· ,nbsp:+,trail:·,extends:→,precedes:←'
opt.backup = false
opt.writebackup = false
opt.showmode = false
opt.swapfile = false
opt.scrolloff = 5
opt.shortmess = 'aoOTIcF'
opt.splitright = true
opt.tags = './tags;,tags'
opt.ttimeoutlen = 10
opt.wildignorecase = true
opt.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**';
opt.clipboard = 'unnamedplus'

opt.expandtab = true
opt.autoindent = true
opt.shiftwidth = 2
opt.softtabstop = -1
opt.linebreak = true
opt.signcolumn = 'yes'

local os_name = vim.loop.os_uname().sysname
if os_name == 'Darwin' then
  g.clipboard = {
    name = "macOS-clipboard",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy",
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste",
    },
    cache_enabled = 0
  }
end
