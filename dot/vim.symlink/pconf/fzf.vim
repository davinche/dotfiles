Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
let g:fzf_action = {
\ 'ctrl-m': 'e',
\ 'ctrl-t': 'tabedit',
\ 'ctrl-s': 'botright split',
\ 'ctrl-v': 'vertical botright split'
\ }
nnoremap <silent><leader>p :FZF<CR>
