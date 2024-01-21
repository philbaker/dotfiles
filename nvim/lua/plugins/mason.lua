-- [nfnl] Compiled from fnl/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local mason = require("mason")
  return mason.setup()
end
return {{"williamboman/mason.nvim", init = _1_}}
