-- Telescope
local cmd = vim.cmd
local api = vim.api

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup{
    defaults = {
        mapping = {
          i = {
            ["<esc>"] = actions.close,
          }
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
        sorting_strategy = "ascending",
        prompt_position = "top",
        file_ignore_patterns = {'node_modules', 'flow%-typed'},
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

-- disable deoplete
cmd"autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)"

api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope fd<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rw', '<cmd>Telescope grep_string<cr>', { noremap = true })
