local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/browse.fnl"
local _2amodule_name_2a = "config.plugin.browse"
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
local browse = autoload("browse")
do end (_2amodule_locals_2a)["browse"] = browse
browse.setup({bookmarks = {github = {name = "search github from neovim", code_search = "https://github.com/search?q=%s&type=code", issues_search = "https://github.com/search?q=%s&type=issues", pulls_search = "https://github.com/search?q=%s&type=pullrequests", repo_search = "https://github.com/search?q=%s&type=repositories"}}})
return _2amodule_2a