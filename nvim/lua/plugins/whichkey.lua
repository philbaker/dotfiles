-- [nfnl] Compiled from fnl/plugins/whichkey.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
return {{"folke/which-key.nvim", opts = {triggers_blacklist = {n = {"'", "\"", "v"}}}}}
