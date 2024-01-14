local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/nvimufo.fnl"
local _2amodule_name_2a = "config.plugin.nvimufo"
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
local ufo, util = autoload("ufo"), autoload("config.util")
do end (_2amodule_locals_2a)["ufo"] = ufo
_2amodule_locals_2a["util"] = util
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
util["set-key"]("zR", ":lua require('ufo').openAllFolds()<CR>", false)
util["set-key"]("zM", ":lua require('ufo').closeAllFolds()<CR>", false)
util["set-key"]("zr", ":lua require('ufo').openFoldsExceptKinds()<CR>", false)
util["set-key"]("zm", ":lua require('ufo').closeFoldsWith(1)<CR>", false)
local function _1_(bufnr, filetype, buftype)
  return {"treesitter", "indent"}
end
ufo.setup({provider_selector = _1_})
return _2amodule_2a