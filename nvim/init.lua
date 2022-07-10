require('impatient').enable_profile()

if require 'core.first_load'() then
  return
end

-- Always map leader first
vim.g.mapleader = ','

-- Core
require 'core.options'
require 'core.autocmds'
require 'core.commands'
require 'core.mappings'
require 'core.plugins'

local cmd = vim.cmd

cmd "command! PackerInstall packadd packer.nvim | lua require('core.plugins').install()"
cmd "command! PackerUpdate packadd packer.nvim | lua require('core.plugins').update()"
cmd "command! PackerSync packadd packer.nvim | lua require('core.plugins').sync()"
cmd "command! PackerClean packadd packer.nvim | lua require('core.plugins').clean()"
cmd "command! PackerCompile packadd packer.nvim | lua require('core.plugins').compile()"

-- Colorscheme
require 'colorscheme.tokyonight'

-- LSP
require 'lsp'
