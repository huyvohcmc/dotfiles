local M = {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
}

function M.config()
  local set = vim.keymap.set

  set('n', '-', ':NvimTreeFindFile<CR>')
  set('n', '<leader>n', ':NvimTreeToggle<CR>')
  set('n', '<leader>r', ':NvimTreeRefresh<CR>')

  local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    if directory then
      vim.cmd.cd(data.file)
    end

    -- open the tree
    require('nvim-tree.api').tree.open()
  end

  vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })

  require('nvim-tree').setup {
    view = {
      width = 40,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = { 'fzf', 'help', 'git' },
    },
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
      group_empty = true,
      icons = {
        git_placement = 'after',
        glyphs = {
          default = '',
          folder = {
            default = '',
            open = '',
          },
        },
      },
    },
  }
end

return M
