local g = vim.g
local api = vim.api

g.nvim_tree_ignore = { '.git', 'node_modules', 'dist' }
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = { 'dashboard' }
g.nvim_tree_tab_open = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_disable_netrw = 0
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_follow = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 1
}
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_hijack_cursor = 1
g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "qf",
    "Trouble"
  }
}

api.nvim_set_keymap('n', '-', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
