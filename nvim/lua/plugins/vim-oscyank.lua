-- [nfnl] fnl/plugins/vim-oscyank.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.ex.let("g:oscyank_max_length = 0")
  nvim.ex.let("g:oscyank_silent = 0")
  nvim.ex.let("g:oscyank_trim = 0")
  nvim.ex.let("g:oscyank_osc52 = \"\27]52;c;%s\7\"")
  vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator")
  return vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual")
end
return {{"ojroques/vim-oscyank", config = _2_}}
