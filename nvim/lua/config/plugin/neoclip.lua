local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/neoclip.fnl"
local _2amodule_name_2a = "config.plugin.neoclip"
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
local neoclip = autoload("neoclip")
do end (_2amodule_locals_2a)["neoclip"] = neoclip
neoclip.setup()
return _2amodule_2a