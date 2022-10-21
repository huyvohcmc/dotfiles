local lspconfig = require 'lspconfig'

local M = {}
M.setup = function(options)
  lspconfig.solargraph.setup {
    on_attach = options.on_attach,
    capabilities = options.capabilities,
    flags = options.flags,
  }
end

return M
