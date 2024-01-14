local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/theme.fnl"
local _2amodule_name_2a = "config.plugin.theme"
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
local theme = autoload("onedark")
do end (_2amodule_locals_2a)["theme"] = theme
theme.setup({colors = {fg0 = "#fafafa"}, comment_style = "italic", keyword_style = "NONE", function_style = "NONE", variable_style = "NONE"})
return _2amodule_2a