local _2afile_2a = "/home/pb/.config/nvim/fnl/config/mapping.fnl"
local _2amodule_name_2a = "config.mapping"
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
local nvim, util = autoload("aniseed.nvim"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
vim.o.timeoutlen = 500
util["set-key"]("<space>", "<nop>")
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
util["set-key"]("<S-Up>", "<C-w>+", true)
util["set-key"]("<S-Down>", "<C-w>-", true)
util["set-key"]("<S-Right>", "<C-w>>", true)
util["set-key"]("<S-Left>", "<C-w><", true)
util["set-key"]("<Esc>", "<C-\\><C-n>", false, "t")
util["set-key"]("<C-R>", "<C-R>", false)
return _2amodule_2a