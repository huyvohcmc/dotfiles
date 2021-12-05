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

vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
