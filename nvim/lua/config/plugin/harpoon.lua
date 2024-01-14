local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/harpoon.fnl"
local _2amodule_name_2a = "config.plugin.harpoon"
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
local harpoon, nvim, util = autoload("harpoon"), autoload("aniseed.nvim"), autoload("config.util")
do end (_2amodule_locals_2a)["harpoon"] = harpoon
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["util"] = util
util["set-key"]("<leader>hf", ":lua require('harpoon.mark').add_file()<CR>", true)
util["set-key"]("<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", true)
util["set-key"]("<leader>ha", ":lua require('harpoon.ui').nav_file(1)<CR>", true)
util["set-key"]("<leader>hb", ":lua require('harpoon.ui').nav_file(2)<CR>", true)
util["set-key"]("<leader>hc", ":lua require('harpoon.ui').nav_file(3)<CR>", true)
util["set-key"]("<leader>hd", ":lua require('harpoon.ui').nav_file(4)<CR>", true)
util["set-key"]("<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", true)
util["set-key"]("<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", true)
return _2amodule_2a