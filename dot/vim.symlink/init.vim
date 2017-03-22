filetype plugin indent on
syntax on
let g:mapleader="\<space>"
let s:vimdir = expand('~/.vim/')
let s:plugged = s:vimdir . '/autoload/plug.vim'
if !filereadable(s:plugged)
    execute 'silent !curl -fLo ' . s:plugged . ' --create-dirs'
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

let g:python_host_prog = expand('~') . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = expand('~') . '/.pyenv/versions/neovim3/bin/python'

" -----------------------------------------------------------------------------
" Plugins ---------------------------------------------------------------------
" -----------------------------------------------------------------------------
call plug#begin(s:vimdir . 'plugged')
runtime! pconf/*.vim
runtime! uconf/*.vim
call plug#end()

" -----------------------------------------------------------------------------
" Color Schemes ---------------------------------------------------------------
" -----------------------------------------------------------------------------
set background=dark
colorscheme palenight
let g:lightline.colorscheme = 'palenight'

" colorscheme gruvbox
" colorscheme nord
" let g:nord_comment_brightness = 8
" colorscheme hybrid_material
" colorscheme hybrid_reverse
" colorscheme vim-material
" colorscheme material

if has('termguicolors')
    set termguicolors
endif

" -----------------------------------------------------------------------------
" General Editing -------------------------------------------------------------
" -----------------------------------------------------------------------------
set hidden
set title
set number
set relativenumber
set laststatus=2
set colorcolumn=72,79,120
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
" set completeopt=menu,menuone,preview
if has('persistent_undo')
    let &undodir = s:vimdir . '.undodir/'
    set undofile
endif


" Spacing --------------------------------------------------------------
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=120
set showbreak=↪\ 
set list!
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Ignores --------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*\.DS_Store
set wildignore+=*sass-cache*
set wildignore+=\.git,\.svn

" Editor Enhancements --------------------------------------------------
augroup editorautocmd
    autocmd!
    autocmd FileType * :setlocal formatoptions-=o
    autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
    autocmd VimResized * wincmd =
augroup END

" KEYBINDINGS ----------------------------------------------------------
vmap < <gv
vmap > >gv
nmap j gj
nmap k gk
nnoremap dd ddk
nnoremap * *``
nnoremap <leader>cd :lcd %:p:h<CR>

" Custom Fns -----------------------------------------------------------
nmap <leader>v :vsplit $MYVIMRC<CR>
nnoremap <leader>bc :call comment#BlockComment()<CR>
nnoremap <leader>lc :call comment#LineComment()<CR>
