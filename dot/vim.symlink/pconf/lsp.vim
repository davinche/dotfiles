" " -----------------------------------------------------------------------------
" " LSP INSTALLS ----------------------------------------------------------------
" " -----------------------------------------------------------------------------
" let s:lspMap = {
"     \ 'pyls': {
"         \ 'install': ['pip2 install python-language-server', 'pip3 install python-language-server'],
"         \ 'configs': [{ 'name': 'pyls', 'cmd': {server_info->['pyls']}, 'whitelist': ['python'], }],
"     \ },
"     \ 'cquery': {
"         \ 'install': ['brew tap twlz0ne/homebrew-cquery', 'brew install cquery'],
"         \ 'configs': [
"             \ {
"               \ 'name': 'cquery',
"               \ 'cmd': {server_info->['cquery']},
"               \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"               \ 'initialization_options': { 'cacheDirectory': '/path/to/cquery/cache' },
"               \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"             \ }
"         \]
"     \ },
"     \ 'typescript-language-server': {
"         \ 'install': ['npm install -g typescript typescript-language-server'],
"         \ 'configs': [
"             \ {
"                 \ 'name': 'typescript-language-server',
"                 \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"                 \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"                 \ 'whitelist': ['typescript'],
"             \ },
"             \ {
"                 \ 'name': 'typescript-language-server',
"                 \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"                 \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
"                 \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
"             \ },
"         \ ]
"     \ },
"     \ 'rls': {
"         \ 'install': ['rustup update', 'rustup component add rls-preview rust-analysis rust-src'],
"         \ 'configs': [ { 'name': 'rls', 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']}, 'whitelist': ['rust'] } ]
"     \ },
"     \ 'go-langserver': {
"         \ 'install': ['go get -u github.com/sourcegraph/go-langserver'],
"         \ 'configs': [ { 'name': 'go-langserver', 'cmd': {server_info->['go-langserver', '-mode', 'stdio']}, 'whitelist': ['go'] } ]
"     \ },
"     \ 'dart_language_server': {
"         \ 'install': ['pub global activate dart_language_server'],
"         \ 'configs': [ { 'name': 'dart_language_server', 'cmd': {server_info->['dart_language_server']}, 'whitelist': ['dart'] } ]
"     \ },
" \ }

" function! EnableLSP(info)
"     if a:info.status == 'unchanged' && !a:info.force
"         return
"     endif
"     for item in items(s:lspMap)
"         if !executable(item[0])
"             let l:installCmds = get(item[1], 'install')
"             for cmd in l:installCmds
"                 execute '!' . cmd
"             endfor
"         endif
"     endfor
" endfunction

" Plug 'prabirshrestha/vim-lsp' , { 'do': function('EnableLSP') }
" for item in items(s:lspMap)
"     if executable(item[0])
"         let configs = get(item[1], 'configs')
"         for config in configs
"             let joined = join(get(config, 'whitelist'), ',')
"             autocmd User lsp_setup call lsp#register_server(config)
"             execute 'autocmd! FileType ' . joined . ' nnoremap <buffer><leader>gd :LspDefinition<CR>'
"             execute 'autocmd! FileType ' . joined . ' nnoremap <buffer><leader>h :LspHover<CR>'
"             execute 'autocmd! FileType ' . joined . ' nnoremap <buffer><leader>rf :LspRename<CR>'
"         endfor
"     endif
" endfor

" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')

" " for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')


" " -----------------------------------------------------------------------------
" " LSP INSTALLS ----------------------------------------------------------------
" " -----------------------------------------------------------------------------
" let s:lspMap = {
"     \ 'pyls': {
"         \ 'install': ['pip2 install python-language-server', 'pip3 install python-language-server'],
"         \ 'configs': [{ 'name': 'pyls', 'cmd': ['pyls'], 'whitelist': ['python'], }],
"     \ },
"     \ 'typescript-language-server': {
"         \ 'install': ['npm install -g typescript typescript-language-server'],
"         \ 'configs': [
"             \ {
"                 \ 'name': 'typescript-language-server',
"                 \ 'cmd': ['typescript-language-server', '--stdio'],
"                 \ 'whitelist': ['typescript'],
"             \ },
"         \ ]
"     \ },
"     \ 'javascript-typescript-langserver': {
"         \ 'install': ['npm install -g javascript-typescript-langserver'],
"         \ 'configs': [
"             \ {
"                 \ 'name': 'javascript-typescript-langserver',
"                 \ 'cmd': ['javascript-typescript-stdio'],
"                 \ 'whitelist': ['javascript', 'javascript.jsx']
"             \ },
"         \ ]
"     \ },
"     \ 'rls': {
"         \ 'install': ['rustup update', 'rustup component add rls-preview rust-analysis rust-src'],
"         \ 'configs': [ { 'name': 'rls', 'cmd': ['rustup', 'run', 'nightly', 'rls'], 'whitelist': ['rust'] } ]
"     \ },
"     \ 'go-langserver': {
"         \ 'install': ['go get -u github.com/sourcegraph/go-langserver'],
"         \ 'configs': [ { 'name': 'go-langserver', 'cmd': ['go-langserver', '-mode', 'stdio'], 'whitelist': ['go'] } ]
"     \ },
"     \ 'dart_language_server': {
"         \ 'install': ['pub global activate dart_language_server'],
"         \ 'configs': [ { 'name': 'dart_language_server', 'cmd': ['dart_language_server'], 'whitelist': ['dart'] } ]
"     \ },
" \ }

" function! EnableLSP(info)
"     if a:info.status == 'unchanged' && !a:info.force
"         return
"     endif
"     execute '!bash install.sh'
"     for item in items(s:lspMap)
"         if !executable(item[0])
"             let l:installCmds = get(item[1], 'install')
"             for cmd in l:installCmds
"                 execute '!' . cmd
"             endfor
"         endif
"     endfor
" endfunction

" Plug 'autozimu/LanguageClient-neovim', {
" \ 'branch': 'next',
" \ 'do': function('EnableLSP'),
" \ }

" augroup lsplangs
"     autocmd!
"     let g:LanguageClient_serverCommands = {}
"     for item in items(s:lspMap)
"         let configs = get(item[1], 'configs', [])
"         for config in configs
"             let cmd = get(config, 'cmd', [])
"             let langs = get(config, 'whitelist', [])
"             for lang in langs
"                 let g:LanguageClient_serverCommands[lang] = cmd
"                 execute 'autocmd FileType ' . lang . ' nnoremap <silent> <leader>gd :call LanguageClient#textDocument_definition()<CR>'
"                 execute 'autocmd FileType ' . lang . ' nnoremap <silent> <leader>r :call LanguageClient#textDocument_rename()jCR>'
"                 execute 'autocmd FileType ' . lang . ' nnoremap <silent> <leader>h :call LanguageClient_contextMenu()<CR>'
"                 execute 'autocmd FileType ' . lang . ' nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>'
"             endfor
"         endfor
"     endfor
" augroup end

