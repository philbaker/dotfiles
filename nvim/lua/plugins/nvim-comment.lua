-- [nfnl] Compiled from fnl/plugins/nvim-comment.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local nvim_comment = require("nvim_comment")
local function _2_()
  return nvim_comment.setup()
end
return {{"terrortylor/nvim-comment", init = _2_}}
