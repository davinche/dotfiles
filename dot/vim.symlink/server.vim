" -----------------------------------------------------------------------------
" AUTOINSTALL PLUGGED ---------------------------------------------------------
" -----------------------------------------------------------------------------
let s:vimdir = '~/.vim/'
let s:plugged = '~/.vim/autoload/plug.vim'
if has('nvim')
    let s:vimdir = '~/.nvim/'
    let s:plugged = '~/.config/nvim/autoload/plug.vim'
endif
let s:vimdir = expand(s:vimdir)
let s:plugged = expand(s:plugged)
if empty(glob(s:plugged))
    execute 'silent !curl -fLo ' . s:plugged . ' --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

" AUTO RELOAD VIMRC-----------------------------------------------------
augroup nvimrc
    autocmd!
    if(has('nvim'))
        autocmd BufWritePost init.vim so %
    else
        autocmd BufWritePost .vimrc so %
    endif
augroup end

" -----------------------------------------------------------------------------
" Plugins ---------------------------------------------------------------------
" -----------------------------------------------------------------------------
filetype plugin indent off
call plug#begin(s:vimdir . 'plugged')
Plug 'davinche/gruvbox', { 'do': 'git submodule update --init' }

" Editing --------------------------------------------------------------
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'reedes/vim-pencil'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wincent/loupe'
Plug 'Olical/vim-enmasse'
Plug 'davinche/whitespace-vim'
Plug 'dhruvasagar/vim-table-mode'

" Code -----------------------------------------------------------------
Plug 'w0rp/ale'
Plug 'othree/jspc.vim', {
    \ 'for': ['javascript', 'javascript.jsx']
    \ }

" Markdown -------------------------------------------------------------
Plug 'nelstrom/vim-markdown-folding', { 'for': ['*markdown'] }

" Navigation -----------------------------------------------------------
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Info -----------------------------------------------------------------
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Front End ------------------------------------------------------------
Plug 'othree/csscomplete.vim', { 'for': ['*css', '*scss'] }
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-jdaddy', { 'for': ['*json'] }
Plug 'chemzqm/vim-jsx-improve', { 'for': ['*jsx'] }
call plug#end()

" -----------------------------------------------------------------------------
" PLUGIN CONFIGURATION --------------------------------------------------------
" -----------------------------------------------------------------------------
filetype plugin indent on

" NetRW ----------------------------------------------------------------
let g:netrw_browse_split = 0
let g:netrw_banner = 0

" ALE ------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" FZF ------------------------------------------------------------------
let g:fzf_action = {
    \ 'ctrl-m': 'e',
    \ 'ctrl-t': 'tabedit',
    \ 'ctrl-s': 'botright split',
    \ 'ctrl-v': 'vertical botright split' }

" Lightline ------------------------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ }

" Table ----------------------------------------------------------------
let g:table_mode_map_prefix = '<leader>t'
let g:table_mode_toggle_map = 'm'
let g:table_mode_corner = '|'

" Loupe-----------------------------------------------------------------
let g:LoupeClearHighlightMap = 1

" White Space ---------------------------------------------------
autocmd! FileType *markdown* :DisableStripWhiteSpaceOnSave
autocmd! FileType * :setlocal formatoptions-=o

" Pencil ---------------------------------------------------------------
let g:pencil#wrapModeDefault = 'soft'

" -----------------------------------------------------------------------------
" EDITOR CONFIGURATIONS -------------------------------------------------------
" -----------------------------------------------------------------------------
if has('termguicolors')
    set termguicolors
    if !has('nvim')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

" Editor Enhancements --------------------------------------------------
augroup editorautocmd
    autocmd!
    autocmd FileType make set noexpandtab
    autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
    autocmd VimResized * wincmd =
    autocmd BufNewFile,BufReadPost *.md,*.mkd set filetype=markdown
    autocmd FileType gitcommit setlocal tw=72 spell
    autocmd BufRead,BufNewFile *.dockerfile setfiletype dockerfile
augroup END

augroup Goyo
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

" -----------------------------------------------------------------------------
" JAVASCRIPT ------------------------------------------------------------------
" -----------------------------------------------------------------------------

" JSX ------------------------------------------------------------------
let g:jsx_ext_required = 1

" Prettier -------------------------------------------------------------
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0

" Typescript -----------------------------------------------------------
let g:nvim_typescript#javascript_support = 1

" -----------------------------------------------------------------------------
" CUSTOM FUNCTIONS ------------------------------------------------------------
" -----------------------------------------------------------------------------
" Comment Block --------------------------------------------------------
function! BlockComment()
    let l:comment = input("Comment Chars: ")
    let l:nchars = len(getline("."))
    let l:ncomment = len(l:comment)
    execute "normal! O" . l:comment .
        \ "\<esc>80A-\<esc>80\<bar>D0f-r Yjpki" . l:comment "\<esc>" .
        \ "\<esc>80A-\<esc>80\<bar>D" . string(l:ncomment + l:nchars + 2) . "\<bar>r "
    call cursor(line("."), l:ncomment + 2)
endfunction

" Comment Line ---------------------------------------------------------
function! LineComment()
    let l:comment = input("Comment Chars: ")
    let l:ncomment = len(l:comment)
    execute "normal! I" . l:comment . " \<esc>80A-\<esc>80\<bar>D0f-r\<space>"
    call cursor(line("."), l:ncomment + 2)
endfunction


" -----------------------------------------------------------------------------
" Color Schemes ---------------------------------------------------------------
" -----------------------------------------------------------------------------
set background=dark
colorscheme gruvbox

" -----------------------------------------------------------------------------
" General Editing -------------------------------------------------------------
" -----------------------------------------------------------------------------
set hidden
set title
set number
set relativenumber
set laststatus=2
set noerrorbells visualbell t_vb=
set backspace=start,indent,eol
set hlsearch
set incsearch
set ignorecase
set nojoinspaces
set lazyredraw
set foldenable
set nobackup
set nowritebackup
set noswapfile
set showmode
set smartcase

if has('persistent_undo')
    let &undodir = s:vimdir . '.undodir/'
    set undofile
endif

if has('nvim')
    set inccommand=split
endif

" Syntax ------------------------------------k--------------------------
syntax on
set colorcolumn=72,79,120

" Spacing --------------------------------------------------------------
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=120

" Ignores --------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*\.DS_Store
set wildignore+=*sass-cache*
set wildignore+=\.git,\.svn

" -----------------------------------------------------------------------------
" KEYBINDINGS -----------------------------------------------------------------
" -----------------------------------------------------------------------------
let g:mapleader="\<space>"

if has('nvim')
    tnoremap <esc> <C-\><C-n>
endif

" Plugins --------------------------------------------------------------
nmap <Nop> <Plug>(LoupeStar)
vmap <leader>a <Plug>(EasyAlign)
vmap <leader>la <Plug>(LiveEasyAlign)
nnoremap <silent><leader>p :FZF<CR>
map <silent><F2> :Goyo <bar> :TogglePencil <CR>

" Remapping ------------------------------------------------------------
vmap < <gv
vmap > >gv
nmap j gj
nmap k gk
nnoremap dd ddk
nnoremap * *``

" Custom Fns -----------------------------------------------------------
nmap <leader>v :vsplit $MYVIMRC<CR>
nmap <leader>d :Lex<CR>
nnoremap <leader>bc :call BlockComment()<CR>
nnoremap <leader>lc :call LineComment()<CR>
