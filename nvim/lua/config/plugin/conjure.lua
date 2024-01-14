local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/conjure.fnl"
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
local nvim, util = autoload("aniseed.nvim"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
nvim.g["conjure#mapping#doc_word"] = "K"
nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
nvim.g["conjure#hud#ignore_low_priority"] = "v:true"
nvim.g["conjure#mapping#prefix"] = "<leader>c"
util["set-key"]("<localleader>ecc", "^l<leader>cecr:sleep 10m<CR>f;hxi<CR><ESC>$", false)
util["set-key"]("<leader>cdl", "vie<m-e>y:ConjureEval (def <c-r>\")<cr>", false)
return _2amodule_2a