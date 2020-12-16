local g = vim.g

local setup = function()
  -- Skip providers
  require'providers'

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

  -- Load plugins
  require'plugins'

  -- Load options
  require'options'.setup()

  -- Load mapping
  require'mapping'.setup()

  -- Load colorscheme
  require'theme'.setup()

  -- Load autocmd
  require'autocmd'.setup()

  -- Other settings
  require'treesitter'
  require'_colorizer'
  require'sneak'
  -- require'_tree'
  require'dirvish'
  require'fzf'
  require'fugitive'
  require'signify'
  require'ncm2'
  require'ale'
  require'ctags'
end

setup()
