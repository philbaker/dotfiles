local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/undotree.fnl"
local _2amodule_name_2a = "config.plugin.undotree"
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
util["set-key"]("<leader>f", ":UndotreeToggle<CR>", false)
nvim.ex.let("g:undotree_WindowLayout = 3")
return _2amodule_2a