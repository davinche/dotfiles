function! comment#BlockComment()
    let l:comment = input("Comment Chars: ")
    let l:nchars = len(getline("."))
    let l:ncomment = len(l:comment)
    execute "normal! O" . l:comment .
        \ "\<esc>80A-\<esc>80\<bar>D0f-r Yjpki" . l:comment "\<esc>" .
        \ "\<esc>80A-\<esc>80\<bar>D" . string(l:ncomment + l:nchars + 2) . "\<bar>r "
    call cursor(line("."), l:ncomment + 2)
endfunction

function! comment#LineComment()
    let l:comment = input("Comment Chars: ")
    let l:ncomment = len(l:comment)
    execute "normal! I" . l:comment . " \<esc>80A-\<esc>80\<bar>D0f-r\<space>"
    call cursor(line("."), l:ncomment + 2)
endfunction
