local group = vim.api.nvim_create_augroup("markdown_preview", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "markdown", command = [[nmap <leader>md :<C-u>MarkdownPreview<CR>]], group = group})
