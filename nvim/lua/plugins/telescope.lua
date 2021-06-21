local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    winblend = 0,
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.8,
      height = 0.85,
      preview_cutoff = 120,
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },
      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },
    selection_strategy = "reset",
    prompt_position = "top",
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    color_devicons = true,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
      },
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    file_sorter = sorters.get_fzy_sorter,
    file_ignore_patterns = {'.git', 'node_modules', 'flow%-typed'},
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  },
}

require("telescope").load_extension("fzy_native")

vim.api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope find_files hidden=true<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>rw', '<cmd>Telescope grep_string<cr>', { noremap = true })
