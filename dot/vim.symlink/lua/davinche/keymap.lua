local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", outer_opts, opts or {})
        vim.keymap.set(op, lhs, rhs, opts)
    end
end


M.nmap = bind("n", { noremap = false })
M.vmap = bind("v", { noremap = false })
M.xmap = bind("x", { noremap = false })
M.imap = bind("i", { noremap = false })
M.tmap = bind("t", { noremap = false })
M.cmap = bind("c", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")
M.cnoremap = bind("c")
return M