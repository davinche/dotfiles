Plug 'mzlogin/vim-markdown-toc'
augroup Markdown
    autocmd!
    autocmd FileType markdown,vimwiki nnoremap <leader>toc :GenTocGFM<CR>
augroup END
