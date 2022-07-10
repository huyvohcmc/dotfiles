local lspconfig = require 'lspconfig'

local M = {}
M.setup = function(on_attach, capabilities)
  lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 200 },
  }
end

return M
