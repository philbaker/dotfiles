-- [nfnl] Compiled from fnl/plugins/nvim-paredit-fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local nvim_paredit_fennel = require("nvim-paredit-fennel")
  return nvim_paredit_fennel.setup()
end
return {{"julienvincent/nvim-paredit-fennel", dependencies = {"julienvincent/nvim-paredit"}, ft = {"fennel"}, config = _1_}}
