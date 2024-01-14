local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/fzf.fnl"
local _2amodule_name_2a = "config.plugin.fzf"
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
util["set-key"]("<leader>td", ":Files ~/dotfiles<CR>", true)
util["set-key"]("<leader>tn", ":Files ~/neotes<CR>", true)
util["set-key"]("<leader>tf", ":Files ~/Downloads<CR>", true)
util["set-key"]("<leader>aa", "<Plug>AgRawSearch", true)
util["set-key"]("<leader>av", ":Sv ", true)
util["set-key"]("<leader>an", ":Sn ", true)
util["set-key"]("<leader>au", ":AgRaw -u ", true)
util["set-key"]("<leader>am", ":Marks<CR>", true)
util["set-key"]("<leader>al", ":tab help ", true)
nvim.ex.let("$FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all,ctrl-d:deselect-all'")
return _2amodule_2a