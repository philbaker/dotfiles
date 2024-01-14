local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/neoterm.fnl"
local _2amodule_name_2a = "config.plugin.neoterm"
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
nvim.ex.let("g:neoterm_autoscroll = 1")
nvim.ex.let("g:neoterm_size = 10")
util["set-key"]("<leader>E", "<Plug>(neoterm-repl-send)", false, "v")
return _2amodule_2a