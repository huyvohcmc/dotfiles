-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local cmd = vim.cmd

-- Only required if you have packer in your `opt` pack
cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Simple plugins can be specified as strings
  use '/usr/local/opt/fzf'
  use 'junegunn/fzf.vim'
  use 'justinmk/vim-sneak'
  use 'mhinz/vim-signify'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'ncm2/ncm2'
  use 'ncm2/ncm2-bufword'
  use 'ncm2/ncm2-tagprefix'
  use 'ncm2/ncm2-path'
  use 'roxma/nvim-yarp'
  use 'christoomey/vim-tmux-navigator'
  use 'romainl/vim-cool'
  use 'norcalli/nvim-colorizer.lua'
  use 'chuling/equinusocio-material.vim'
  use 'justinmk/vim-dirvish'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'ruby', 'javascript', 'go'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use {
    'vim-ruby/vim-ruby',
    opt = true,
    ft = 'ruby'
  }

  -- Plugins can have post-install/update hooks
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    opt = true,
    ft = 'go'
  }
end)
