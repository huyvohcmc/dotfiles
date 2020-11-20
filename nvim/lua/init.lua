local providers = require'_providers'
local options = require'_options'
local autocmd = require'_autocmd'
local mapping = require'_mapping'
local theme = require'_theme'
local M = {}

function M.init()
  -- Skip providers
  providers:skip()

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
  -- vim.g.loaded_netrw             = 1
  vim.g.loaded_netrwPlugin       = 1
  vim.g.loaded_netrwSettings     = 1
  vim.g.loaded_netrwFileHandlers = 1

  -- Load plugins
  require'_plugins'

  -- Load options
  options:load_options()

  -- Load mapping
  mapping:load_mapping()

  -- Load colorscheme
  theme:load_colorscheme()

  -- Load autocmd
  autocmd.load_autocmds()

  -- Other settings
  require'_treesitter'
  require'_colorizer'
  require'_sneak'
  require'_dirvish'
  require'_fzf'
  require'_fugitive'
  require'_signify'
  require'_ncm2'
  require'_ale'
  require'_ctags'
end

M.init()
