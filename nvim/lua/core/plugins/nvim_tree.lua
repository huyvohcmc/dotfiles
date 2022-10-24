local g = vim.g
local set = vim.keymap.set

set('n', '-', ':NvimTreeFindFile<CR>')
set('n', '<leader>n', ':NvimTreeToggle<CR>')
set('n', '<leader>r', ':NvimTreeRefresh<CR>')

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = { 'fzf', 'help', 'git' },
  },
  ignore_ft_on_setup = { 'git', 'man', 'help' },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = { '^.git$', 'node_modules/', '.DS_Store' },
    exclude = { '.env', 'application.yml' },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = false,
        exclude = {
          filetype = { 'packer', 'qf', 'Trouble', 'diff' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
  },
  renderer = {
    group_empty = false,
    icons = {
      show = {
        git = false,
        file = false,
        folder = false,
        folder_arrow = false,
      },
      glyphs = {
        symlink = '',
      },
    },
  },
}
