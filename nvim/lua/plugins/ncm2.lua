local api = vim.api

local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_stab()
  return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<S-Tab>'
end

api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.smart_stab()', {expr = true, noremap = true})

api.nvim_exec([[
augroup ncm2
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END
]], '')
