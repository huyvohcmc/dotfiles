local g = vim.g
local api = vim.api

g.lua_tree_side = 'left'
g.lua_tree_width = 40
g.lua_tree_ignore = {'.git', 'node_modules', '.cache', '.DS_Store'}
g.lua_tree_auto_open = 1
g.lua_tree_auto_close = 1
g.lua_tree_quit_on_open = 1
g.lua_tree_follow = 1
g.lua_tree_git_hl = 1
g.lua_tree_tab_open = 1
g.lua_tree_allow_resize = 1
g.lua_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0
}

api.nvim_set_keymap('n', '-', ':LuaTreeToggle<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>r', ':LuaTreeRefresh<CR>', { noremap = true })
api.nvim_set_keymap('n', '<Leader>n', ':LuaTreeFindFile<CR>', { noremap = true })
