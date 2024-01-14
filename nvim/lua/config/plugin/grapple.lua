local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/grapple.fnl"
local _2amodule_name_2a = "config.plugin.conjure"
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
util["set-key"]("<leader>hh", ":GrapplePopup tags<CR>", false)
util["set-key"]("<leader>ht", ":GrappleTag<CR>", false)
util["set-key"]("<leader>hn", ":GrappleCycle forward<CR>", false)
util["set-key"]("<leader>hp", ":GrappleCycle backward<CR>", false)
util["set-key"]("<leader>ha", ":GrappleSelect key=1<CR>", false)
util["set-key"]("<leader>hb", ":GrappleSelect key=2<CR>", false)
util["set-key"]("<leader>hc", ":GrappleSelect key=3<CR>", false)
util["set-key"]("<leader>hd", ":GrappleSelect key=4<CR>", false)
return _2amodule_2a