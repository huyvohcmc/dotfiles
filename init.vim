" Neovim installation: https://github.com/neovim/neovim/wiki/Installing-Neovim
" Maintainer: Huy Vo


if (has("termguicolors"))
  set termguicolors
endif

syntax on

let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" List ends here. Plugins become visible to Neovim after this call.
call plug#end()

" Colorscheme
let g:nord_comment_brightness = 20
colorscheme nord

set hidden
set wildmenu
set showcmd
set ignorecase
set smartcase
set nobackup
set noswapfile
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

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Airline basic config
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

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
