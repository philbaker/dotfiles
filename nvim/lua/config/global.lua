-- [nfnl] fnl/config/global.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.ex.set("nowrap")
do
  local options = {backup = true, termguicolors = true, colorcolumn = "80", splitbelow = true, splitright = true, completeopt = "menuone,noselect", inccommand = "nosplit", ignorecase = true, smartcase = true, signcolumn = "yes", undofile = true, undodir = vim.fn.expand("~/.undodir"), confirm = true, breakindent = true, list = true, clipboard = "unnamedplus", scrolloff = 3, number = true, relativenumber = true, swapfile = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
nvim.ex.autocmd("FileType", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
nvim.ex.let("neoterm_autoinsert=1")
nvim.ex.let("markdown_folding=1")
vim.cmd("au FileType markdown setlocal foldlevel=99")
nvim.ex.autocmd("FileType", "qf", "wincmd J")
vim.cmd("autocmd BufNewFile,BufRead *.phel set syntax=clojure")
vim.opt.background = "dark"
vim.cmd("colorscheme tokyonight")
vim.opt.backupdir:remove(".")
vim.opt.listchars = {tab = "\226\150\184 ", trail = "\194\183"}
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
vim.api.nvim_create_augroup("conjure-set-state-key-on-filetype", {clear = true})
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile", "BufEnter"}, {group = "conjure-set-state-key-on-filetype", pattern = "*.fnl", command = ":ConjureClientState fnl"})
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile", "BufEnter"}, {group = "conjure-set-state-key-on-filetype", pattern = "*.clj,*.cljc", command = ":ConjureClientState clj"})
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile", "BufEnter"}, {group = "conjure-set-state-key-on-filetype", pattern = "*.cljs", command = ":ConjureClientState cljs"})
vim.g.clipboard = {copy = {["*"] = require("vim.ui.clipboard.osc52").copy("*"), ["+"] = require("vim.ui.clipboard.osc52").copy("+")}, name = "OSC 52", paste = {["*"] = require("vim.ui.clipboard.osc52").paste("*"), ["+"] = require("vim.ui.clipboard.osc52").paste("+")}}
return {}
