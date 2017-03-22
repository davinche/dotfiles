Plug 'rust-lang/rust.vim', { 'for': ['*rust'] }
Plug 'timonv/vim-cargo', { 'for': ['*rust'] }

let g:rustfmt_autosave = 1
augroup rust_plugin
    autocmd! Filetype rust nmap <leader>r :CargoRun<CR>
augroup end
