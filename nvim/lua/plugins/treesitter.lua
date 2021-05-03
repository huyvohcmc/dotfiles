require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash', 'c', 'cpp', 'go', 'java', 'javascript', 'json', 'lua', 'python', 'ruby', 'toml'},
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  -- indent = {
  --   enable = true,
  -- }
}
