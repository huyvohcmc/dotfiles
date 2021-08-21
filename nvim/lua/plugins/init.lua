local cmd = vim.cmd

cmd [[packadd packer.nvim]]

cmd [[autocmd BufWritePost init.lua PackerCompile]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-repeat'
  use 'wellle/targets.vim'
  use 'romainl/vim-cool'

  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require "surround".setup {}
    end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function() require'plugins.compe' end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }

  use {
    'f-person/git-blame.nvim',
    config = function() require'plugins.blame' end
  }

  use 'marko-cerovac/material.nvim'
  use 'folke/tokyonight.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require'plugins.signs' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    },
    config = function() require'plugins.telescope' end
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require'plugins.treesitter' end,
  }

  use {
    'w0rp/ale',
    ft = {'ruby', 'javascript', 'go'},
    cmd = 'ALEEnable',
    config = function() require'plugins.ale' end
  }

  use {
    'tpope/vim-rails',
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

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require'plugins.indent_blankline' end
  }

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      vim.api.nvim_set_keymap("n", "s", ":HopChar1<CR>", {silent = true, noremap = false})
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<CR>", {silent = true, noremap = false})
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'plugins.nvim_tree' end
  }

  use {
    'windwp/nvim-autopairs',
    config = function() require'plugins.autopairs' end
  }

  use {
    'sindrets/diffview.nvim',
    opt = true,
    cmd = {'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles'}
  }

  use {
    'neovim/nvim-lspconfig',
    ocnfig = function() require'plugins.lsp' end
  }
end)
