-- [nfnl] Compiled from fnl/plugins/vim-test.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.ex.let("test#strategy = 'slimux'")
  nvim.ex.let("test#php#phpunit#executable = 'vendor/bin/phpunit'")
  return nvim.ex.let("test#javascript#runner = 'vitest'")
end
return {{"vim-test/vim-test", config = _2_}}
