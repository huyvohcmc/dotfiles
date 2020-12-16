local g = vim.g
local providers = {}

function providers.setup()
  g.python_host_skip_check = 1
  g.python_host_prog = '/usr/bin/python2'
  g.python3_host_skip_check = 1
  g.python3_host_prog = '/usr/local/bin/python3'
  g.loaded_node_provider = 0
  g.loaded_ruby_provider = 0
  g.loaded_perl_provider = 0
end

return providers
