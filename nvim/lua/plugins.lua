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
  use 'justinmk/vim-sneak'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-endwise'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'hrsh7th/nvim-compe'
  use 'christoomey/vim-tmux-navigator'
  use 'romainl/vim-cool'
  use 'norcalli/nvim-colorizer.lua'
  use 'justinmk/vim-dirvish'
  use 'chuling/ci_dark'
  use 'Yggdroot/indentLine'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'}
    }
  }

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