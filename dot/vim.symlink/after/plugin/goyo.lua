-- GOYO
local goyo = vim.api.nvim_create_augroup("goyo", { clear = true })
vim.api.nvim_create_autocmd("User", {pattern="GoyoEnter", command = "Limelight", group = goyo})
vim.api.nvim_create_autocmd("User", {pattern="GoyoLeave", command = "Limelight!", group = goyo })

local pencil = vim.api.nvim_create_augroup('pencil', { clear = true })
vim.api.nvim_create_autocmd("Filetype", { pattern = "markdown,mkd,vimwiki", command = [[call pencil#init({'wrap': 'hard', 'autoformat': 0, 'textwidth': 72})]], group = pencil})
