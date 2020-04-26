" Faster loading (https://neovim.io/doc/user/provider.html)
if has('nvim')
  let g:python_host_skip_check = 1
  let g:python3_host_skip_check = 1
  if executable('python2')
    let g:python_host_prog = exepath('python2')
  endif
  if executable('python3')
    let g:python3_host_prog = exepath('python3')
  endif
endif

let g:loaded_rrhelper = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Minpac
try
  packadd minpac
catch
  fun! InstallPlug() " Bootstrap plugin manager on new systems.
    exe '!git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac'
  endfun
endtry
if exists('*minpac#init') "{{{
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('justinmk/vim-sneak')
call minpac#add('junegunn/fzf', { 'do': 'yes n \| ./install' })
call minpac#add('junegunn/fzf.vim')
call minpac#add('mhinz/vim-signify')
call minpac#add('sheerun/vim-polyglot')
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
call minpac#add('andreypopp/vim-colors-plain')
call minpac#add('justinmk/vim-dirvish')
endif "}}}

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" General settings (see :h vim-differences)
filetype plugin indent on
set clipboard^=unnamed
set completeopt=noinsert,menuone,noselect
set copyindent
" Don't mess with 'tabstop', with 'expandtab' it isn't used.
" Instead set softtabstop=-1, then 'shiftwidth' is used.
set expandtab shiftwidth=2 softtabstop=-1
set hidden
set incsearch hlsearch ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set matchpairs+=<:>
set nobackup
set noshowmode
set noswapfile
set scrolloff=5
set shortmess+=cW
set splitright
set tags=./tags;,tags
set termguicolors
set ttimeoutlen=0
set wildignore+=tags,*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem,*.pyc,*.swp,*~,*/.DS_Store
set wildmode=longest:full,list,full

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Colorscheme
function! s:plain() abort
  hi clear VertSplit
  hi VertSplit guifg=#000000
  hi! link PmenuSel TermCursor
  hi! link Todo Comment
  hi! Search guifg=#e32791 guibg=NONE gui=underline,bold
  hi! IncSearch guifg=#191919 guibg=#e32791
  hi! StatusLine guibg=NONE
  hi! StatusLineNC guibg=NONE
endfunction

augroup colorscheme
  autocmd ColorScheme plain call s:plain()
augroup END

colorscheme plain

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
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader><cr> :let @/ = ""<cr>

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
  autocmd FileType dirvish nnoremap <buffer>mv :Dirvish %<CR>:call <SID>SetupCommandOnFile("mv -n")<CR>
  autocmd FileType dirvish nnoremap <buffer>M :Dirvish %<CR>:call <SID>SetupCommandOnFile("mv -n")<CR>
  autocmd FileType dirvish nnoremap <buffer>rd :Dirvish %<CR>:call <SID>SetupRemoveCommandOnFile()<CR>
  autocmd FileType dirvish nnoremap <buffer>rm :Dirvish %<CR>:call <SID>SetupCommandOnFile("rm")<CR>
  autocmd FileType dirvish nnoremap <buffer>R :Dirvish %<CR>:call <SID>SetupCommandOnFile("rm")<CR>
  autocmd FileType dirvish nnoremap <buffer>cp :Dirvish %<CR>:call <SID>SetupCommandOnFile("cp")<CR>
  autocmd FileType dirvish nnoremap <buffer>C :Dirvish %<CR>:call <SID>SetupCommandOnFile("cp")<CR>
  autocmd FileType dirvish nnoremap <buffer>mk :Dirvish %<CR>:!mkdir
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
    let cmd = "rmdir"
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
let g:signify_sign_change = '-'
hi! link SignifySignAdd DiffAdd
hi! link SignifySignChange DiffChange
hi! link SignifySignDelete DiffDelete

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
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'] }
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }
hi! link ALEError DiffDelete
hi! link ALEErrorSign DiffDelete
hi! link ALEWarning DiffChange
hi! link ALEWarningSign DiffChange
