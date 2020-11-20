local providers = require'_providers'
local options = require'_options'
local autocmd = require'_autocmd'
local mapping = require'_mapping'
local theme = require'_theme'
local M = {}

function M.init()
  -- Skip providers
  providers:skip()

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
