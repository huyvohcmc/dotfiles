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

" Enable syntax
if !exists("g:syntax_on")
  syntax enable
endif

" Disable unused built-in plugins
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
let g:loaded_netrwPlugin = 1

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
  call packager#add('junegunn/fzf.vim')
  call packager#add('justinmk/vim-sneak')
  call packager#add('junegunn/fzf.vim')
  call packager#add('mhinz/vim-signify')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('tomtom/tcomment_vim')
  call packager#add('tpope/vim-endwise')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-rails')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-rhubarb')
  call packager#add('tpope/vim-surround')
  call packager#add('w0rp/ale')
  call packager#add('wellle/targets.vim')
  call packager#add('rstacruz/vim-closer')
  call packager#add('ncm2/ncm2')
  call packager#add('ncm2/ncm2-bufword')
  call packager#add('ncm2/ncm2-tagprefix')
  call packager#add('ncm2/ncm2-path')
  call packager#add('roxma/nvim-yarp')
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('justinmk/vim-dirvish')
  call packager#add('co1ncidence/mountaineer')
  call packager#add('romainl/vim-cool')
  call packager#add('fatih/vim-go')
endfunction

" Packager commands
command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" Colorscheme
set termguicolors
set background=dark
silent! colorscheme mountaineer

" Custom colors
hi! VertSplit gui=NONE guifg=#333333 guibg=NONE
hi! link PmenuSel TermCursor
hi! link Todo Comment
hi! link Conceal NonText
hi! Comment gui=italic guifg=#666666
hi! StatusLine gui=underline
hi! IncSearch gui=underline guifg=#1f1f24 guibg=#fef937
hi! Search guifg=#ffffff guibg=#43454b

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

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish nnoremap <buffer>M :Dirvish %<CR>:call <SID>SetupCommandOnFile("mv -n")<CR>
  autocmd FileType dirvish nnoremap <buffer>D :Dirvish %<CR>:call <SID>SetupRemoveCommandOnFile()<CR>
  autocmd FileType dirvish nnoremap <buffer>C :Dirvish %<CR>:call <SID>SetupCommandOnFile("cp")<CR>
  autocmd FileType dirvish nnoremap <buffer>mk :Dirvish %<CR>:!mkdir
  autocmd FileType dirvish nnoremap <buffer>ma :Dirvish %<CR>:!touch
augroup END

function! s:SetupCommandOnFile(cmd) abort
  let reg_save = @@
  let reg_save2 = @*
  silent exe "normal! ^yg_"
  let filename_string = @@
  let filename = fnameescape(expand(filename_string))
  let @@ = a:cmd
  " This doesn't use `silent` because `silent requires a `:redraw!` after
  call feedkeys(':!' . a:cmd . " " . filename . " ")
  let @@ = reg_save
  let @* = reg_save2
endfunction

function! s:SetupRemoveCommandOnFile() abort
  let reg_save = @@
  let reg_save2 = @*
  silent exe "normal! ^yg_"
  let filename_string = @@
  let filename = fnameescape(expand(filename_string))
  if filereadable(filename_string)
    let cmd = "rm"
  else
    let cmd = "rm -rf"
  endif
  " This doesn't use `silent` because `silent requires a `:redraw!` after
  call feedkeys(':!' . cmd . " " . filename)
  let @@ = reg_save
  let @* = reg_save2
endfunction

" FZF
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" Ripgrep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always
        \ -g "!*.lock" -g "!*lock.json" -g "!node_modules/**" -g "!flow-typed/**" -g "!.git/**"
        \ --smart-case %s || true'
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
let g:signify_sign_change = '-'

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
let g:ale_sign_error = '×'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format='%linter% %severity% (%code%): %s'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'] }
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }
hi! link ALEError DiffDelete
hi! link ALEErrorSign DiffDelete
hi! link ALEWarning DiffChange
hi! link ALEWarningSign DiffChange
