"==================================================
" Vim configuration made with blood sweat and tears
"==================================================

" Load nvim faster
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:ruby_path='/usr/bin/ruby'

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" General
filetype plugin indent on
set autochdir
set autoindent
set autoread
set background=dark
set copyindent
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set hidden
set history=500
set hlsearch incsearch ignorecase smartcase
set laststatus=2
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.,eol:¬
set mouse=""
set nobackup
set nocursorline
set nocursorcolumn
set noshowmode
set noswapfile
set number
set relativenumber
set rulerformat=%l\:%c
set noshowmatch
set showtabline=2
set scrolloff=10
set smarttab
set tags=./tags
set termguicolors
set title
set wildmenu
set wildmode=list:longest,full
set wrap

" Colorscheme
let g:nord_comment_brightness = 20
colorscheme nord

" Leader mapping
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
map <silent> <leader><cr> :let @/=""<cr>
map <leader>s :source ~/.config/nvim/init.vim<CR>

" Disable useless arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

" Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" Activate FZF search panel
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" NERDTree mapping and config
map <C-n> :NERDTreeToggle<CR>
map <C-c> :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.o$', '\~', '\.pyc$', '\.git$', '\.hg$', '\.DS_Store']

" Run NERDTreeTabs on console startup
let g:nerdtree_tabs_open_on_console_startup = 2

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
      \ 'enable': {
      \   'tabline': 1,
      \ },
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
\   'python': ['flake8'],
\ }
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'python': ['autopep8'],
\ }
