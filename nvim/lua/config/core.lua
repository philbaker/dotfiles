local _2afile_2a = "/home/pb/.config/nvim/fnl/config/core.fnl"
local _2amodule_name_2a = "config.core"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local core, nvim = autoload("aniseed.core"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
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
vim.cmd("colorscheme tokyonight")
do end (vim.opt.backupdir):remove(".")
vim.opt.listchars = {tab = "\226\150\184 ", trail = "\194\183"}
return _2amodule_2a