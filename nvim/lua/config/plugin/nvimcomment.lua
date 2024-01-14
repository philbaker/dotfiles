local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/nvimcomment.fnl"
local _2amodule_name_2a = "config.plugin.nvimcomment"
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
local nvim_comment = autoload("nvim_comment")
do end (_2amodule_locals_2a)["nvim_comment"] = nvim_comment
local function _1_()
  return (require("ts_context_commentstring.internal")).update_commentstring()
end
nvim_comment.setup({hook = _1_})
return _2amodule_2a