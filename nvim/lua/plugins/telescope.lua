local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 0,

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
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
    sorting_strategy = "ascending",
    -- scroll_strategy = "cycle",
    color_devicons = false,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
      },
    },

    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },

  extensions = {
    fzf_native = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

require("telescope").load_extension("fzf")

local api = vim.api

local opts = {
  noremap = true,
  silent = true,
}

api.nvim_set_keymap("n", "<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
api.nvim_set_keymap("n", "<Leader>ft", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
api.nvim_set_keymap("n", "<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
api.nvim_set_keymap("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep({previewer=false})<CR>", opts)
api.nvim_set_keymap("n", "<Leader>gw", "<cmd>lua require('telescope.builtin').grep_string({previewer=false})<CR>", opts)
api.nvim_set_keymap("n", "<Leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
