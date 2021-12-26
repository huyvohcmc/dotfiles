vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]]

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
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    },
    config = function() require'plugins.cmp' end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }

  use {
    'f-person/git-blame.nvim',
    config = function() require'plugins.blame' end
  }

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

  use 'neovim/nvim-lspconfig'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  use {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
    config = function() require'plugins.trouble' end
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' }
  }

  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'plugins.gitlinker' end
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
