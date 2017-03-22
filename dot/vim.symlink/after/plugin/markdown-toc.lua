local group = vim.api.nvim_create_augroup("markdown_toc", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "markdown", command = [[nnoremap <leader>toc :GenTocGFM<CR>]], group = group})
