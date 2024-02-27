-- [nfnl] Compiled from fnl/plugins/nvim-comment.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local nvim_comment = require("nvim_comment")
local function _2_()
  local function _3_()
    return (require("ts_context_commentstring.internal")).update_commentstring()
  end
  return nvim_comment.setup({hook = _3_})
end
return {{"terrortylor/nvim-comment", init = _2_}}
