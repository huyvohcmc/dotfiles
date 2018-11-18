" Neovim configuration made with blood sweat and tears

" Faster loading
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.config/nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tagprefix'
Plug 'roxma/nvim-yarp'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
call plug#end()

" General settings (see :h vim-differences)
filetype plugin indent on
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set copyindent
set expandtab
set tabstop=2
set shiftwidth=0 " Always have the same value with `tabstop`
set softtabstop=-1 " Always have the same value with `shiftwidth`
set hidden
set ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set noshowmode
set noswapfile
set number relativenumber
set rulerformat=%l\:%c
set scrolloff=10
set shortmess+=c
set termguicolors
set wildmode=list:longest,full

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Colorscheme
colorscheme tender

" Leader general mapping
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>re :source %<cr>
nnoremap <silent><leader><cr> :nohlsearch<cr>

" Easy navigation
noremap <leader>s <c-w>w
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" NERDTree mapping and config
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>c :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['^\~$[[dir]]', '^\.o$[[file]]', '^\.pyc$[[file]]', '^\.git$[[dir]]', '^\.DS_Store$[[file]]']

" FZF mapping
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Ripgrep
noremap <leader>rg <esc>:Rg<space>
noremap <leader>rw <esc>:Rg <c-r><c-w>
noremap <leader>rh <esc>:Rg<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" Signify config
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '▪'
let g:signify_sign_change = '▪'
let g:signify_sign_delete = '▪'
let g:signify_sign_delete_first_line = '▪'
" Small hack, will remove this when tender get update
highlight SignColumn guibg=#282828
highlight link SignifySignAdd GitGutterAdd
highlight link SignifySignChange GitGutterChange
highlight link SignifySignDelete GitGutterDelete
highlight link SignifySignChangeDelete GitGutterChangeDelete
highlight link SignifySignDeleteFirstLine SignifySignDelete

" Gutentags exclude
let g:gutentags_exclude_project_root = ['/usr/local', '/Users/huyvo']
let g:gutentags_ctags_exclude = ['*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*']

" Refresh statusline after Gutentags background process has ended
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LightLine config
let g:lightline = {}
let g:lightline.colorscheme = 'tenderplus'
let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head',
      \ 'gutentags': 'gutentags#statusline',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'relativepath', 'modified', 'gutentags' ] ],
      \ 'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
      \ }

" ALE config
nmap <leader>e <Plug>(ale_fix)
let g:ale_sign_error = '✖'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier', 'flow'] }
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }
