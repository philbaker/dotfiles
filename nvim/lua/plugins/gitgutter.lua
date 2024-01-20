-- [nfnl] Compiled from fnl/plugins/gitgutter.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local util = autoload("config.util")
local function _2_()
  nvim.ex.let("g:gitgutter_map_keys = 0")
  return util["set-key"]("<leader>ghs", "<Plug>(GitGutterStageHunk)", true, "x")
end
return {{"airblade/vim-gitgutter", config = _2_}}
