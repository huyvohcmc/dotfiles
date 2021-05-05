  require'gitsigns'.setup{
    signs = {
      add          = { hl = 'GitGutterAdd', text = '▋' },
      change       = { hl = 'GitGutterChange', text = '▋' },
      delete       = { hl = 'GitGutterDelete', text = '▋' },
      topdelete    = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '▎' },
    }
  }
