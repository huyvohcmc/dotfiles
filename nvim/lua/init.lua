local M = {}

function M.setup()
  -- Skip providers
  require'_providers'

  -- Disable distribution plugins
  vim.g.loaded_gzip              = 1
  vim.g.loaded_tar               = 1
  vim.g.loaded_tarPlugin         = 1
  vim.g.loaded_zip               = 1
  vim.g.loaded_zipPlugin         = 1
  vim.g.loaded_getscript         = 1
  vim.g.loaded_getscriptPlugin   = 1
  vim.g.loaded_vimball           = 1
  vim.g.loaded_vimballPlugin     = 1
  vim.g.loaded_matchit           = 1
  vim.g.loaded_matchparen        = 1
  vim.g.loaded_2html_plugin      = 1
  vim.g.loaded_logiPat           = 1
  vim.g.loaded_rrhelper          = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1

  -- Load plugins
  require'_plugins'

  -- Load options
  require'_options'.setup()

  -- Load mapping
  require'_mapping'.setup()

  -- Load colorscheme
  require'_theme'.setup()

  -- Load autocmd
  require'_autocmd'.setup()

  -- Other settings
  require'_treesitter'
  require'_colorizer'
  require'_sneak'
  require'_tree'
  require'_fzf'
  require'_fugitive'
  require'_signify'
  require'_ncm2'
  require'_ale'
  require'_ctags'
end

M.setup()
