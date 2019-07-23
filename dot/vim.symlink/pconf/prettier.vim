Plug 'prettier/vim-prettier', {
\ 'do': 'npm install',
\ 'for': [ 'javascript', 'javascript.jsx', 'typescript', 'typescript.jsx', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html']
\ }
" let g:prettier#autoformat = 0
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
nmap <Leader>pt <Plug>(Prettier)

function! s:PrettierToggle()
    if g:prettier#autoformat == 1
        let g:prettier#autoformat = 0
        echo "PrettierToggle [OFF]"
    else
        let g:prettier#autoformat = 1
        echo "PrettierToggle [ON]"
    endif
endfunction

" function! s:PrettierExec()
"     if g:prettier#writeonsave == 1
"         execute ":PrettierAsync<CR>"
"     endif
" endfunction

command! -nargs=0 PrettierToggle call s:PrettierToggle()

" augroup PRETTIER
"     autocmd!
"     let g:prettier#writeonsave = 1
"     let g:prettier#autoformat = 0
"     " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html :call s:PrettierExec()
"     autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.graphql,*.md :call s:PrettierExec()
" augroup END
