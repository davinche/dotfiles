function! InstallDeps(info)
    if a:info.status == 'installed' || a:info.force
        let extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-vetur', 'coc-emmet', 'coc-rls']
        call coc#util#install()
        call coc#util#install_extension(extensions)
    endif
endfunction

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': function('InstallDeps') }

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
