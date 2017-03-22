if has('nvim')
    set inccommand=split
    tnoremap <esc> <C-\><C-n>
else
    " term colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
