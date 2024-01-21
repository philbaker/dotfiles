-- [nfnl] Compiled from fnl/plugins/neoterm.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local util = autoload("config.util")
local function _2_()
  nvim.ex.let("g:neoterm_autoscroll = 1")
  nvim.ex.let("g:neoterm_size = 10")
  return util["set-key"]("<leader>E", "<Plug>(neoterm-repl-send)", false, "v")
end
return {{"kassio/neoterm", config = _2_}}
