"=====================================================
" Neovim configuration made with blood sweat and tears
"=====================================================

" Faster loading
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'roxma/nvim-completion-manager'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }
call plug#end()

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Colorscheme
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
colorscheme nord

" General settings (some are enabled by default, see :h vim-differences)
filetype plugin indent on
set autoindent
set autoread
set copyindent
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set hidden
set history=500
set incsearch hlsearch ignorecase smartcase
set laststatus=2
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set mouse=""
set nobackup
set noshowmatch
set noshowmode
set noswapfile
set number
set relativenumber
set ruler rulerformat=%l\:%c
set scrolloff=10
set showcmd
set showtabline=2
set smarttab
set tags=./tags;,tags
set termguicolors
set title
set updatetime=100
set wildmenu
set wildmode=list:longest,full
set wrap

" Leader mapping
let mapleader = ","
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<cr>
nnoremap <silent> <leader><cr> :silent :let @/ = ""<cr>

" System clipboard mapping
vnoremap <leader>y "+y
nnoremap <leader>p "+p

" Easy navigation
noremap <leader>s <c-w>w
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Disable useless arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" NERDTree mapping and config
map <leader>n :NERDTreeToggle<CR>
map <leader>c :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.o$', '\~', '\.pyc$', '\.git$', '\.hg$', '\.DS_Store']

" Activate FZF search panel
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Ag search
map <leader>ag <esc>:Ag<space>

" Git mapping
map <silent> gb :Gblame<CR>
map <silent> ghub :Gbrowse<CR>

" Git gutter custom symbols
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_removed_first_line = '━'
let g:gitgutter_sign_modified_removed = '┅'

" Gutentags exclude
let g:gutentags_exclude_project_root = ['/usr/local', '/Users/huyvo']
let g:gutentags_ctags_exclude = ['*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*']

" Refresh statusline after Gutentags background process has ended
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

" Use <TAB> to select nvim-completion-manager's popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Hide ncm menu and also start a new line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" LightLine config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'gutentags' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'gutentags': 'gutentags#statusline',
      \ },
      \ }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ]
      \ }

" Prettier
let g:prettier#exec_cmd_async = 1

" Ale basic config
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '▲'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Ale linters
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \ }
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \ }
