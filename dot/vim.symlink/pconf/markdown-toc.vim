Plug 'mzlogin/vim-markdown-toc'
augroup Markdown
    autocmd!
    autocmd FileType markdown nnoremap <leader>toc :GenTocGFM<CR>
augroup END
