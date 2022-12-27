local M = {
  'ruifm/gitlinker.nvim',
  event = 'BufReadPre',
  cond = function()
    return vim.loop.fs_stat '.git'
  end,
}

function M.config()
  local linker = require 'gitlinker'
  local actions = linker.actions
  local set = vim.keymap.set

  linker.setup {
    mappings = nil,
  }

  set('n', 'gl', function()
    linker.get_buf_range_url('n', { action_callback = actions.open_in_browser })
  end)
  set('v', 'gl', function()
    linker.get_buf_range_url('v', { action_callback = actions.open_in_browser })
  end)
  set('n', 'gB', function()
    linker.get_repo_url { action_callback = actions.open_in_browser }
  end)
end

return M
