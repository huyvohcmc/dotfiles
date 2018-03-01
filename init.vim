" Neovim installation: https://github.com/neovim/neovim/wiki/Installing-Neovim

if (has("termguicolors"))
  set termguicolors
endif

if !has('gui_running')
  set t_Co=256
endif

if !exists("g:syntax_on")
  syntax enable
endif

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" List ends here. Plugins become visible to vim after this call.
call plug#end()

" Colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
colorscheme nord

" General
set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase
set nobackup
set noswapfile
set laststatus=2
set showtabline=2
set scrolloff=10
set sidescroll=1
set sidescrolloff=15
set autochdir
set autoindent
set copyindent
set autoread
set history=500
set lazyredraw
set relativenumber
set number
set ruler
set rulerformat=%l\:%c
set showmatch
set cursorline
set noshowmode
set hlsearch incsearch ignorecase smartcase
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set list listchars=tab:·\ ,space:·,trail:·,eol:¬

" Disable useless arrow keys
noremap <Up> <NOP>
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

" Activate fzf search panel
map ; :Files<CR>

" Show hidden files
let NERDTreeShowHidden = 1

" Run NERDTreeTabs on console vim startup
let g:nerdtree_tabs_open_on_console_startup = 2

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
