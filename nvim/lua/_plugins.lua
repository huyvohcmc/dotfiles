-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

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
  use 'co1ncidence/mountaineer'
  use 'romainl/vim-cool'
  use 'nvim-treesitter/nvim-treesitter'
  use 'norcalli/nvim-colorizer.lua'
  use 'kyazdani42/nvim-tree.lua'

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'rb', 'js', 'go'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  use {'vim-ruby/vim-ruby', ft = 'rb'}

  -- Plugins can have post-install/update hooks
  use {'fatih/vim-go', ft = 'go', cmd = 'GoUpdateBinaries'}
end)
