Plug 'davinche/goviz-vim', { 'for': ['*markdown', '*viz'] }
augroup goviz_plugin
    autocmd!
    autocmd FileType dot nnoremap <leader>md :GovizPreview<CR>
augroup end
