require('trouble').setup({
  icons = false,
  fold_open = "v",
  fold_closed = ">",
  indent_lines = true,
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info"
  },
})

local set = vim.keymap.set

set("n", "<leader>e", "<cmd>TroubleToggle<cr>")
set("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>")
set("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>")
set("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
set("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
