local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/telekasten.fnl"
local _2amodule_name_2a = "config.plugin.telekasten"
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
local telekasten, util = autoload("telekasten"), autoload("config.util")
do end (_2amodule_locals_2a)["telekasten"] = telekasten
_2amodule_locals_2a["util"] = util
telekasten.setup({home = vim.fn.expand("~/neotes/all")})
util["set-key"]("<leader>z", "<cmd>Telekasten panel<CR>", false)
util["set-key"]("<C-c><C-c>", ":lua require('telekasten').toggle_todo({onlyTodo=true})<CR>", false)
return _2amodule_2a