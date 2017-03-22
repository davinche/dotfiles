vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use) 
    use 'drewtempelmeyer/palenight.vim'
    use 'Numkil/ag.nvim'
    use 'junegunn/vim-easy-align'
    use 'sgur/vim-editorconfig'
    use 'mattn/emmet-vim'
    use 'tpope/vim-fugitive'
    use 'junegunn/gv.vim'
    use {'fatih/vim-go', ft = {'go'}, run = ':GoInstallBinaries' }
    use 'junegunn/limelight.vim'
    use 'junegunn/goyo.vim'
    use 'reedes/vim-pencil'
    use 'itchyny/lightline.vim'
    use {'iamcco/markdown-preview.nvim', run = '!cd app & yarn install', ft = {'markdown'}}
    use 'mzlogin/vim-markdown-toc'
    use 'dhruvasagar/vim-table-mode'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-rails'
    use 'tpope/vim-vinegar'
    use {'tpope/vim-jdaddy', ft = {'json'}}
    use 'guns/xterm-color-table.vim'
    use {'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}
    use 'terrastruct/d2-vim'

    -- LSP Stuff
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)
