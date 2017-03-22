Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'

augroup Goyo
    autocmd!
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,vimwiki call pencil#init({'wrap': 'hard', 'autoformat': 0, 'textwidth': 72})
augroup END
map <silent><F2> :Goyo<CR>
