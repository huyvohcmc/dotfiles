" Providers {{{
let g:python_host_skip_check = 1
if executable('python2')
  let g:python_host_prog = exepath('python2')
else
  let g:loaded_python_provider = 0
endif

let g:python3_host_skip_check = 1
if executable('python3')
  let g:python3_host_prog = exepath('python3')
else
  let g:loaded_python3_provider = 0
endif

let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
" }}}

set rtp+=/usr/local/opt/fzf

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('justinmk/vim-sneak')
call minpac#add('mhinz/vim-signify')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('w0rp/ale')
call minpac#add('wellle/targets.vim')
call minpac#add('rstacruz/vim-closer')
call minpac#add('ncm2/ncm2')
call minpac#add('ncm2/ncm2-bufword')
call minpac#add('ncm2/ncm2-tagprefix')
call minpac#add('ncm2/ncm2-path')
call minpac#add('roxma/nvim-yarp')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('co1ncidence/mountaineer')
call minpac#add('romainl/vim-cool')
call minpac#add('fatih/vim-go', { 'type': 'opt' })
call minpac#add('vim-ruby/vim-ruby', { 'type': 'opt' })
call minpac#add('nvim-treesitter/nvim-treesitter')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

augroup pack_filetype
  autocmd!
  autocmd FileType go packadd vim-go
  autocmd FileType ruby packadd vim-ruby
augroup END

" Enable syntax
if !exists("g:syntax_on")
  syntax enable
endif

" General settings (:h vim-differences)
set clipboard^=unnamed
set completeopt=noinsert,menuone,noselect
set copyindent
set expandtab shiftwidth=2 softtabstop=-1
set hidden
set incsearch hlsearch ignorecase smartcase
set lazyredraw
set linebreak
set list
set listchars=tab:··\ ,extends:›,precedes:‹,nbsp:·,trail:·
set matchpairs+=<:>
set nobackup
set nowritebackup
set signcolumn=yes
set noshowmode
set noswapfile
set scrolloff=5
set shortmess+=c
set splitright
set tags=./tags;,tags
set ttimeoutlen=0
set wildignore+=tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store
set wildmode=longest:full,list,full

" Custom colors
function! s:mountaineer() abort
  hi! Visual guibg=#9EC49F guifg=#050505
  hi! SignColumn guibg=NONE
  hi! StatusLine guifg=white
endfunction

augroup colorscheme
  autocmd ColorScheme mountaineer call s:mountaineer()
augroup END

" Colorscheme
set termguicolors
colorscheme mountaineer

" Detect whitespace and color as gray
hi! ExtraWhitespace guifg=#666666
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call  clearmatches()

" Tree-sitter
lua <<EOF
vim.cmd('packadd nvim-treesitter')
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" Automatic resizing of splits to equal sizes
autocmd VimResized * wincmd =

" Vim Sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Leader general mapping
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>s <c-w>w
nnoremap <leader>r :source $MYVIMRC<cr>

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" Override the netrw :Explore, :Sexplore, :Vexplore commands
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" FZF
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Advanced ripgrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --glob "!{.git,node_modules,flow-typed}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader>rg <esc>:RG<space>
nnoremap <leader>rw <esc>:RG <c-r><c-w>
nnoremap <leader>rh <esc>:RG<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" Signify config
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_change = '~'
hi! SignifySignChange guifg=#F7F6AF
hi! SignifySignDelete guifg=#F7AFC0

" Replace Gutentags
command! Tags !ctags -R -I EXTERN -I INIT --exclude='build*' --exclude='.vim-src/**' --exclude='node_modules/**' --exclude='venv/**'
      \ --exclude='**/site-packages/**' --exclude='data/**' --exclude='dist/**' --exclude='notebooks/**' --exclude='Notebooks/**'
      \ --exclude='*graphhopper_data/*.json' --exclude='*graphhopper/*.json' --exclude='*.json' --exclude='qgis/**' --exclude=.git
      \ --exclude=.svn --exclude=.hg --exclude="*.cache.html" --exclude="*.nocache.js" --exclude="*.min.*" --exclude="*.map"
      \ --exclude="*.swp" --exclude="*.bak" --exclude="*.pyc" --exclude="*.class" --exclude="*.sln" --exclude="*.Master" --exclude="*.csproj"
      \ --exclude="*.csproj.user" --exclude="*.cache" --exclude="*.dll" --exclude="*.pdb" --exclude=tags --exclude="cscope.*" --exclude="*.tar.*"

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ALE config
nmap <leader>e <Plug>(ale_fix)
let g:ale_echo_msg_format='%severity%: %linter%: %s'
let g:ale_set_highlights = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['eslint', 'prettier']
      \}
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['prettier']
      \}
