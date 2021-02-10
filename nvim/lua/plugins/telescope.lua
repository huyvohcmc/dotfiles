-- Telescope
local cmd = vim.cmd
local api = vim.api

local telescope = require('telescope')
telescope.setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "top",
        prompt_prefix = ">",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_defaults = {
            -- TODO add builtin options.
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =    require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    }
}

-- disable deoplete
cmd"autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)"

api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope fd<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rg', '<cmd>Telescope live_grep<cr>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>rw', '<cmd>Telescope grep_string<cr>', { noremap = true })
