local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/copilot.fnl"
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
local copilot = autoload("copilot")
do end (_2amodule_locals_2a)["copilot"] = copilot
vim.g.copilot_filetypes = {javascript = true, php = true, typescript = true, ["*"] = false}
return _2amodule_2a