-- [nfnl] fnl/plugins/conjure.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.g["conjure#mapping#doc_word"] = "K"
  nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  nvim.g["conjure#hud#ignore_low_priority"] = "v:true"
  nvim.g["conjure#mapping#prefix"] = "<leader>c"
  return nil
end
return {{"Olical/conjure", branch = "main", init = _2_}}
