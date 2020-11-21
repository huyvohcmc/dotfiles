local M = {}

function M.setup()
  vim.g.python_host_skip_check = 1
  vim.g.python_host_prog = '/usr/bin/python2'
  vim.g.python3_host_skip_check = 1
  vim.g.python3_host_prog = '/usr/local/bin/python3'
  vim.g.loaded_node_provider = 0
  vim.g.loaded_ruby_provider = 0
  vim.g.loaded_perl_provider = 0
end

M.setup()
