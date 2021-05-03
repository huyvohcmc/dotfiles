-- Telescope
local cmd = vim.cmd
local api = vim.api

local telescope = require('telescope')
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

telescope.setup{
  defaults = {
    winblend = 0,
    preview_cutoff = 120,

    layout_strategy = 'horizontal',
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      }
    },

    selection_strategy = 'reset',
    prompt_position = 'bottom',
    sorting_strategy = 'descending',
    scroll_strategy = 'cycle',

    file_sorter = sorters.get_fzy_sorter,
    file_ignore_patterns = {'.git', 'node_modules', 'flow%-typed'},

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    }
  }
}

telescope.load_extension('fzy_native')

api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope find_files hidden=true<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rw', '<cmd>Telescope grep_string<cr>', { noremap = true })
