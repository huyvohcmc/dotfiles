require'impatient'.enable_profile()

local cmd = vim.cmd

if require "general/first_load"() then
  return
end

-- Always map leader first
vim.g.mapleader = ','

-- General
require('general/options')
require('general/mappings')
require('general/commands')

-- Plugins
require('plugins')

cmd "command! PackerInstall packadd packer.nvim | lua require('plugins').install()"
cmd "command! PackerUpdate packadd packer.nvim | lua require('plugins').update()"
cmd "command! PackerSync packadd packer.nvim | lua require('plugins').sync()"
cmd "command! PackerClean packadd packer.nvim | lua require('plugins').clean()"
cmd "command! PackerCompile packadd packer.nvim | lua require('plugins').compile()"

-- Colorscheme
require('colorscheme/catppuccin')

-- LSP
require('lsp')
