local cmd = vim.cmd

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

cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- Colorscheme
require('colorscheme')

-- LSP
require('lsp')
