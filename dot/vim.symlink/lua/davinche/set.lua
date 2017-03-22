local cmd = vim.cmd
local fn = vim.fn
local packer = fn.expand("~/.local/share/nvim/site/pack/packer/start/packer.nvim")

if fn.filereadable(packer) == 0 then
    fn.execute("silent !git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. packer)
end

-- -----------------------------------------------------------------------------
-- General Editing -------------------------------------------------------------
-- -----------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.opt.guicursor = ""
vim.opt.hidden = true
vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.colorcolumn= {72,79,120}
vim.opt.backspace = {"start","indent","eol"}
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.lazyredraw = true
vim.opt.foldenable = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

-- Spacing --------------------------------------------------------------
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 120
vim.opt.showbreak = "↪ "
-- vim.opt.list!
vim.opt.listchars = {}
vim.opt.listchars["tab"] = "→ "
vim.opt.listchars["eol"] = "↲"
vim.opt.listchars["nbsp"] = "␣"
vim.opt.listchars["trail"] = "•"
vim.opt.listchars["extends"] = "⟩"
vim.opt.listchars["precedes"] = "⟨"
vim.opt.inccommand = "split"
