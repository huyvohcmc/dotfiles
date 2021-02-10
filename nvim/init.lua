local g = vim.g

local skip_providers = function()
  g.python_host_skip_check = 1
  g.python_host_prog = '/usr/bin/python2'
  g.python3_host_skip_check = 1
  g.python3_host_prog = '/usr/local/bin/python3'
  g.loaded_node_provider = 0
  g.loaded_ruby_provider = 0
  g.loaded_perl_provider = 0
end

local disable_distribution_plugins = function()
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
end

local setup = function()
  skip_providers()
  disable_distribution_plugins()

  -- Load options
  require'options'.setup()

  -- Load mapping
  require'keybinds'.setup()

  -- Load autocmd
  require'autocmd'.setup()

  -- Colorscheme
  require'colorscheme'

  -- Ctags command
  require'ctags'

  -- Load plugins
  require'plugins'

  -- Other settings
  require'plugins/treesitter'
  require'plugins/colorizer'
  require'plugins/sneak'
  require'plugins/dirvish'
  require'plugins/fzf'
  require'plugins/fugitive'
  require'plugins/signify'
  require'plugins/ncm2'
  require'plugins/ale'
end

setup()
