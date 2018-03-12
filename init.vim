" Neovim installation: https://github.com/neovim/neovim/wiki/Installing-Neovim

" This must be first, because it changes other options as side effect
set nocompatible

if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

if !exists("g:syntax_on")
  syntax enable
endif

" Change the mapleader from \ to ,
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast reload vim config
map <leader>s :source ~/.config/nvim/init.vim<CR>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

" List ends here. Plugins become visible to vim after this call.
call plug#end()

" Use file type plugins
filetype plugin indent on

" Colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
colorscheme nord

" General
set autochdir
set autoindent
set autoread
set copyindent
set cursorline
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set hidden
set history=500
set hlsearch incsearch ignorecase smartcase
set ignorecase
set laststatus=2
set lazyredraw
set linespace=10
set list listchars=tab:.\ ,space:.,trail:.,eol:¬
set nobackup
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set ruler
set rulerformat=%l\:%c
set scrolloff=10
set showcmd
set showmatch
set showtabline=2
set sidescroll=1
set sidescrolloff=15
set smartcase
set smarttab
set title
set wildmenu

" Disable useless arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Navigate 4x faster when holding down Ctrl
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" NERDTree mapping
map <C-n> :NERDTreeToggle<CR>
map <C-c> :NERDTreeFind<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Activate FZF search panel
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Show hidden files
let NERDTreeShowHidden = 1

" Ignore compiled files
let NERDTreeIgnore = ['\.o$', '\~', '\.pyc$', '\.git$', '\.hg$', '\.DS_Store']

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

" Ale linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['flake8'],
\ }
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['autopep8'],
\ }

" Ale basic config
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
