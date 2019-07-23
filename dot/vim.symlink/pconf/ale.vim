Plug 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'ruby': ['rubocop']
\}
" let g:ale_completion_enabled = 1
" let g:ale_sign_column_always = 1
" let g:ale_completion_delay = 1000
" let g:ale_lint_delay = 1000
command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1 | if get(g:, 'ale_fix_on_save', 0) | echo 'ALEFixer [ON]' | else | echo 'ALEFixer [OFF]' | endif"
