function! InstallDeps(info)
    if a:info.status == 'installed' || a:info.force
        !npm install -g typescript typescript-language-server diagnostic-languageserver eslint_d
        !gem install solargraph
    endif
endfunction

Plug 'neovim/nvim-lspconfig', { 'do': function('InstallDeps') }
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
set completeopt=menu,menuone,noselect
