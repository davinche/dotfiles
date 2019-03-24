Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown'] }
augroup markdown_preview
    autocmd!
    autocmd FileType markdown nmap <leader>md :<C-u>MarkdownPreview<CR>
augroup END
