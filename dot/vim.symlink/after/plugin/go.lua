local group = vim.api.nvim_create_augroup("vimgo", { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = 'go', command = [[nmap <leader>t <Plug>(go-test)]], group = group})
vim.api.nvim_create_autocmd("Filetype", { pattern = 'go', command = [[nmap <leader>b <Plug>(go-build)]], group = group})
vim.api.nvim_create_autocmd("Filetype", { pattern = 'go', command = [[nmap <leader>r <Plug>(go-run)]], group = group})
vim.api.nvim_create_autocmd("Filetype", { pattern = 'go', command = [[nmap <leader>D :GoDoc<CR>]], group = group})
