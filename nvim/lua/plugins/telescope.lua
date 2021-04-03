-- Telescope
local cmd = vim.cmd
local api = vim.api

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    prompt_position = 'top',
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {'node_modules', 'flow%-typed'},
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}

telescope.load_extension('fzy_native')

api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope find_files<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rw', '<cmd>Telescope grep_string<cr>', { noremap = true })
