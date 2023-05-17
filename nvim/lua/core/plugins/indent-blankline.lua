local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
}

function M.config()
  require('indent_blankline').setup {
    buftype_exclude = {
      'nofile',
      'terminal',
      'lspinfo',
    },
    filetype_exclude = {
      'help',
      'dashboard',
      'packer',
      'NvimTree',
    },
    context_patterns = {
      'class',
      'return',
      'function',
      'method',
      '^if',
      '^while',
      'jsx_element',
      '^for',
      '^object',
      '^table',
      'block',
      'arguments',
      'if_statement',
      'else_clause',
      'jsx_element',
      'jsx_self_closing_element',
      'try_statement',
      'catch_clause',
      'import_statement',
      'operation_type',
    },
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    char = '▏',
    context_char = '▏',
  }
end

return M
