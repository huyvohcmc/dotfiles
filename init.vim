let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:airline_powerline_fonts=1
let NERDTreeShowHidden=1

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

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

syntax on
colorscheme Nord

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
set relativenumber
set number
set ruler
set rulerformat=%l\:%c
set showmatch
set cursorline
set hlsearch incsearch ignorecase smartcase
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list

hi clear CursorLine
hi CursorLine gui=underline cterm=underline ctermfg=None guifg=None

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

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <C-c> :NERDTreeFind<CR> 
