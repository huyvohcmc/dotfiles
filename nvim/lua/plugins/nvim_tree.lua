local g = vim.g
local api = vim.api

g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 1
}
g.nvim_tree_group_empty = 1

api.nvim_set_keymap('n', '-', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  hijack_cursor       = true,
  update_cwd          = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = { 'fzf', 'help', 'git' }
  },
  ignore_ft_on_setup = { 'git', 'man', 'help' },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', 'dist', '.DS_Store' }
  },
  view = {
    auto_resize = true,
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
          filetype = { "packer", "qf", "Trouble", "diff" },
          buftype  = { "nofile", "terminal", "help" },
        }
      }
    }
  }
}
