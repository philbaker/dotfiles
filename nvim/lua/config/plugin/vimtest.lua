local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/vimtest.fnl"
local _2amodule_name_2a = "config.plugin.vimtest"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.ex.let("test#strategy = 'neoterm'")
nvim.ex.let("test#php#phpunit#executable = 'vendor/bin/phpunit'")
return _2amodule_2a