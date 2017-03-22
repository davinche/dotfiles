Plug 'fatih/vim-go', { 'for': ['*go'], 'do': ':GoInstallBinaries' }
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
augroup vimgo
    autocmd!
    autocmd Filetype go nmap <leader>t <Plug>(go-test)
    autocmd Filetype go nmap <leader>b <Plug>(go-build)
    autocmd Filetype go nmap <leader>r <Plug>(go-run)
    autocmd Filetype go nmap <leader>gd :GoDoc<CR>
augroup END
