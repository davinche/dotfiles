Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
augroup DisableRainbow
    autocmd!
    autocmd FileType vimwiki :RainbowToggleOff
    autocmd BufEnter,BufRead *.wiki :RainbowToggleOff
augroup END
