local api = vim.api
local g = vim.g
local M = {}

function M.setup()
  g.lua_tree_ignore = { '.git', 'node_modules', '.DS_Store' }
  g.lua_tree_auto_open = 1
  g.lua_tree_auto_close = 0
  g.lua_tree_follow = 1
  g.lua_tree_tab_open = 1
  g.lua_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0
  }
  g.lua_tree_icons = {
    default = '',
    git= {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = ""
    }
  }

  api.nvim_set_keymap('n', '-', ':LuaTreeToggle<CR>', { noremap = true })
  api.nvim_set_keymap('n', '<Leader>r', ':LuaTreeRefresh<CR>', { noremap = true })
  api.nvim_set_keymap('n', '<Leader>n', ':LuaTreeFindFile<CR>', { noremap = true })

  api.nvim_exec([[
  augroup LuaTreeOverride
    au!
    au FileType LuaTree setlocal nowrap
  augroup END
  ]], '')
end

return M
