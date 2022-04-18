--[[ local api = vim.api
local group = api.nvim_create_augroup("ResizingWindows", { clear = true })
api.nvim_create_autocmd("VimResized", { command = "wincmd =", group = group }) ]]
