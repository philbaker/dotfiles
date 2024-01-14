local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/luasnip.fnl"
local _2amodule_name_2a = "config.plugin.luasnip"
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
local core, luasnip = autoload("aniseed.core"), autoload("luasnip")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["luasnip"] = luasnip
do end (require("luasnip.loaders.from_vscode")).lazy_load({paths = {"~/dotfiles/nvim/snippets"}})
return _2amodule_2a