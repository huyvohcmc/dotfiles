local first_load = require('general/first_load')

if first_load() then
  return
end

-- Always map leader first
vim.g.mapleader = ','

-- General
require('general/options')
require('general/mappings')
require('general/autocmd')

-- Plugins
require('plugins')

-- Colorscheme
require('colorscheme')
