local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/vimeasyalign.fnl"
local _2amodule_name_2a = "config.plugin.vimeasyalign"
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
local util = autoload("config.util")
do end (_2amodule_locals_2a)["util"] = util
util["set-key"]("<leader>ea", "<Plug>(EasyAlign)", true, "x")
return _2amodule_2a