Plug 'prettier/vim-prettier', {
\ 'do': 'npm install',
\ 'for': [ 'javascript', 'javascript.jsx', 'typescript', 'typescript.jsx', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html']
\ }
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

command! -nargs=0 PrettierToggle call s:PrettierToggle()
