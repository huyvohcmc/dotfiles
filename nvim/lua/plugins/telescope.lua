local actions = require('telescope.actions')
local sorters = require('telescope.sorters')

require'telescope'.setup {
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

local set = vim.keymap.set

set('n', '<leader>t', function()
  require('telescope.builtin').find_files()
end)

set('n', '<leader>gt', function()
  require('telescope.builtin').git_files()
end)

set('n', '<leader>b', function()
  require('telescope.builtin').buffers()
end)

set('n', '<leader>rg', function()
  require('telescope.builtin').live_grep({previewer=false})
end)

set('n', '<leader>rw', function()
  require('telescope.builtin').grep_string({previewer=false})
end)

set('n', '<leader>h', function()
  require('telescope.builtin').oldfiles()
end)
