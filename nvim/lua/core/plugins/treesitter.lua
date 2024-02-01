local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'BufReadPost',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-endwise',
  },
}

function M.config()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'c',
      'comment',
      'dockerfile',
      'go',
      'gomod',
      'gowork',
      'hcl',
      'html',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'proto',
      'python',
      'ruby',
      'toml',
      'vimdoc',
      'yaml',
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autopairs = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
    },
    indent = {
      enable = true
    },
    endwise = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },
  }
end

return M
