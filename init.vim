"==================================================
" Vim configuration made with blood sweat and tears
"==================================================

" Faster loading
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'roxma/nvim-completion-manager'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

" Colorscheme
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
colorscheme nord

" General
filetype plugin indent on
set autoindent
set autoread
set background=dark
set copyindent
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set hidden
set history=500
set hlsearch ignorecase smartcase
set laststatus=2
set lazyredraw
set linebreak
set list
set mouse=""
set nobackup
set noshowmatch
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set rulerformat=%l\:%c
set scrolloff=10
set showtabline=2
set smarttab
set termguicolors
set title
set updatetime=100
set wildmenu
set wildmode=list:longest,full

" Clear cursor line in NERDTree
hi clear CursorLine

" Leader mapping
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
map <silent> <leader><cr> :noh<cr>

" Easy navigation
noremap <leader>s <c-w>w

" Ag search
map <leader>ag <esc>:Ag<space>

" Disable useless arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Scrolling 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" Git mapping
map <silent> gb :Gblame<CR>
map <silent> ghub :Gbrowse<CR>

" Use <TAB> to select Nvim completion popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Hide the menu and also start a new line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Activate FZF search panel
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" NERDTree mapping and config
map <leader>n :NERDTreeToggle<CR>
map <leader>c :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.o$', '\~', '\.pyc$', '\.git$', '\.hg$', '\.DS_Store']

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" LightLine config
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }
let g:lightline.separator = {
      \ 'left': '', 'right': ''
      \ }
let g:lightline.subseparator = {
      \ 'left': '', 'right': ''
      \ }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ]
      \ }

" Ale basic config
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Ale linters
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop'],
      \ }
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \ }
