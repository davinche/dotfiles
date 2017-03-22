function! s:get_id()
    let match = matchstr(getline('.'), '\d\+')
    return match
endfunction

function! s:line_command(cmd)
    let id = s:get_id()
    if empty(id)
        return
    endif
    execute join([':'.a:cmd, id], ' ')
    call nextup#reload_todos()
endfunction

nnoremap <silent><buffer> <leader>e :call <SID>line_command('NextUpEdit')<CR>
nnoremap <silent><buffer> <leader>c :call <SID>line_command('NextUpComplete')<CR>
nnoremap <silent><buffer> <leader>uc :call <SID>line_command('NextUpUncomplete')<CR>
nnoremap <silent><buffer> <leader>a :call <SID>line_command('NextUpArchive')<CR>
nnoremap <silent><buffer> <leader>ua :call <SID>line_command('NextUpUnarchive')<CR>
nnoremap <silent><buffer> <leader>d :call <SID>line_command('NextUpRemove')<CR>
nnoremap <silent><buffer> <leader>n :NextUp<CR>
