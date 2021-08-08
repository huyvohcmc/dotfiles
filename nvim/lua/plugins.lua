local cmd = vim.cmd

cmd [[ packadd packer.nvim ]]

-- Automatically run :PackerCompile whenever plugins.lua is updated
cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-endwise'
  use 'tpope/vim-rails'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'rstacruz/vim-closer'
  use 'hrsh7th/nvim-compe'
  use 'romainl/vim-cool'
  use 'norcalli/nvim-colorizer.lua'
  use 'justinmk/vim-dirvish'
  use 'f-person/git-blame.nvim'
  use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'

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
    }
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

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

  use({
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        navigation = {
          enable_default_keybindings = true,
        },
      })
    end
  })

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'phaazon/hop.nvim',
    as = 'hop'
  }
end)
