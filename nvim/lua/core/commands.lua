vim.api.nvim_create_user_command('Cppath', function()
  local path = vim.fn.expand '%'
  vim.fn.setreg('+', path)
end, {})
