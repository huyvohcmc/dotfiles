vim.g.mapleader = ','

-- General
require('general/options')
require('general/mappings')
require('general/autocmd')

-- Colorscheme
require('colorschemes/material')

-- Plugins
require('plugins')
require('plugins/treesitter')
require('plugins/colorizer')
require('plugins/sneak')
require('plugins/dirvish')
require('plugins/git_blame')
require('plugins/gitsigns')
require('plugins/compe')
require('plugins/ale')
require('plugins/telescope')
require('plugins/kommentary')
require('plugins/indent_blankline')
