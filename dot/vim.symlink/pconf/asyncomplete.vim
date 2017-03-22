" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" " Sources
" Plug 'Shougo/neco-vim'
" Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Plug 'prabirshrestha/asyncomplete-file.vim'
" Plug 'prabirshrestha/asyncomplete-necovim.vim'
" Plug 'yami-beta/asyncomplete-omni.vim'
" Plug 'prabirshrestha/asyncomplete-gocode.vim'

" let g:asyncomplete_auto_popup = 1
" imap <c-space> <Plug>(asyncomplete_force_refresh)
" " for asyncomplete.vim log
" " let g:lsp_log_verbose = 1
" " let g:lsp_log_file = expand('~/vim-lsp.log')
" " let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" augroup AsyncCompleteSources
"     autocmd!
"     autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
"     \ 'name': 'omni',
"     \ 'whitelist': ['*'],
"     \ 'blacklist': ['c', 'cpp', 'html'],
"     \ 'completor': function('asyncomplete#sources#omni#completor')
"     \  }))
"     " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     " \ 'name': 'buffer',
"     " \ 'whitelist': ['*'],
"     " \ 'blacklist': ['go'],
"     " \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     " \ }))
"     " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"     " \ 'name': 'file',
"     " \ 'whitelist': ['*'],
"     " \ 'priority': 10,
"     " \ 'completor': function('asyncomplete#sources#file#completor')
"     " \ }))
"     autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
"     \ 'name': 'necovim',
"     \ 'whitelist': ['vim'],
"     \ 'completor': function('asyncomplete#sources#necovim#completor'),
"     \ }))
"     " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
"     " \ 'name': 'gocode',
"     " \ 'whitelist': ['go'],
"     " \ 'completor': function('asyncomplete#sources#gocode#completor'),
"     " \ 'config': {
"     " \    'gocode_path': expand('~/go/bin/gocode')
"     " \  },
"     " \ }))
" augroup end
