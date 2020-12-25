require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash', 'c', 'cpp', 'go', 'java', 'javascript', 'json', 'lua', 'python', 'ruby', 'toml'},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
