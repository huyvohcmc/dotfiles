local api = vim.api

local packer_group = api.nvim_create_augroup('Packer', { clear = true })

api.nvim_create_autocmd('BufWritePost', {
  pattern = '*/core/plugins/init.lua',
  command = 'PackerCompile',
  group = packer_group,
})

local packer = nil

local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init {
      disable_commands = true,
      log = { level = 'info' },
    }
  end

  local use = packer.use
  packer.reset()

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'lewis6991/impatient.nvim'
  use 'tpope/vim-projectionist'
  use {
    'glepnir/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
  }
  use 'machakann/vim-sandwich'
  use {
    'rafamadriz/friendly-snippets',
    opt = true,
  }
  use {
    'L3MON4D3/LuaSnip',
    module = 'luasnip',
    wants = 'friendly-snippets',
    config = function()
      require 'core.plugins.luasnip'
    end,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require 'core.plugins.cmp'
    end,
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }
  use {
    'f-person/git-blame.nvim',
    config = function()
      require 'core.plugins.blame'
    end,
  }
  use 'folke/tokyonight.nvim'
  use 'marko-cerovac/material.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'core.plugins.signs'
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
    },
    config = function()
      require 'core.plugins.telescope'
    end,
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'core.plugins.treesitter'
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'RRethy/nvim-treesitter-endwise'
  use {
    'aserowy/tmux.nvim',
    config = function()
      require('tmux').setup {
        navigation = {
          enable_default_keybindings = true,
        },
      }
    end,
  }
  use {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require 'core.plugins.nvim_tree'
    end,
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'core.plugins.autopairs'
    end,
  }
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'folke/which-key.nvim',
    config = function()
      require 'core.plugins.which-key'
    end,
  }
  use {
    'ruifm/gitlinker.nvim',
    config = function()
      require 'core.plugins.gitlinker'
    end,
  }
  use 'ggandor/lightspeed.nvim'
  use {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require 'core.plugins.indent-line'
    end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require 'core.plugins.lualine'
    end,
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
