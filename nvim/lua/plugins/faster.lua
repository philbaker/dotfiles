-- [nfnl] fnl/plugins/faster.fnl
local function _1_()
  local faster = require("faster")
  return faster.setup()
end
return {{"pteroctopus/faster.nvim", init = _1_}}
