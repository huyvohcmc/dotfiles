-- Custom filetype detection logic with the new Lua filetype plugin
vim.filetype.add {
  extension = {
    png = 'image',
    jpg = 'image',
    jpeg = 'image',
    tf = 'terraform',
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
