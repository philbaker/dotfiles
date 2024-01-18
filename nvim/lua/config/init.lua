-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.ex.set("nowrap")
do
  local options = {backup = true, termguicolors = true, colorcolumn = "80", splitbelow = true, splitright = true, completeopt = "menuone,noselect", inccommand = "nosplit", ignorecase = true, smartcase = true, signcolumn = "yes", undofile = true, undodir = vim.fn.expand("~/.undodir"), confirm = true, breakindent = true, list = true, clipboard = "unnamedplus", scrolloff = 3, number = true, relativenumber = true, swapfile = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
nvim.ex.autocmd("FileType", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
nvim.ex.let("neoterm_autoinsert=1")
nvim.ex.autocmd("FileType", "qf", "wincmd J")
vim.cmd("autocmd BufNewFile,BufRead *.phel set syntax=clojure")
do end (vim.opt.backupdir):remove(".")
vim.opt.listchars = {tab = "\226\150\184 ", trail = "\194\183"}
return {}
