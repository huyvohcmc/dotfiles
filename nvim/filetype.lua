if not vim.filetype then
  return
end

-- Activate Lua filetype detection
vim.g.do_filetype_lua = 1

-- Custom filetype detection logic with the new Lua filetype plugin
vim.filetype.add {
  extension = {
    png = 'image',
    jpg = 'image',
    jpeg = 'image',
    tf = 'terraform',
    tsx = 'typescriptreact',
    ts = 'typescript',
  },
  filename = {
    ['.eslintrc'] = 'json',
    ['.prettierrc'] = 'json',
    ['.babelrc'] = 'json',
    ['.stylelintrc'] = 'json',
  },
  pattern = {
    ['.env.*'] = 'sh',
  },
}
