vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')
-- Configuration
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Everything else
local opts = { noremap=true, silent=true }
local nnoremap = require('davinche.keymap').nnoremap
lsp.on_attach(function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = {silent=true, buffer=bufnr }
    nnoremap('K', vim.lsp.buf.hover, bufopts)
    nnoremap('gd', vim.lsp.buf.definition, bufopts)
    nnoremap('gi', vim.lsp.buf.implementation, bufopts)
    nnoremap('gr', vim.lsp.buf.references, bufopts)
    nnoremap('gD', vim.lsp.buf.declaration, bufopts)
    nnoremap('<space>K', vim.lsp.buf.signature_help, bufopts)
    nnoremap('gt', vim.lsp.buf.type_definition, bufopts)
    nnoremap('<F2>', vim.lsp.buf.rename, bufopts)
    nnoremap('<space>rn', vim.lsp.buf.rename, bufopts)
    nnoremap('<space>ca', vim.lsp.buf.code_action, bufopts)
    nnoremap('<space>f', vim.lsp.buf.formatting, bufopts)
    nnoremap('<space>e', vim.diagnostic.open_float, opts)
    nnoremap('[d', vim.diagnostic.goto_prev, opts)
    nnoremap(']d', vim.diagnostic.goto_next, opts)
end)

lsp.nvim_workspace()
lsp.setup()
