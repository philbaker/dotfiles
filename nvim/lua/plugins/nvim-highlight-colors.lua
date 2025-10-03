-- [nfnl] fnl/plugins/nvim-highlight-colors.fnl
local function _1_()
  local nvim_highlight_colors = require("nvim-highlight-colors")
  return nvim_highlight_colors.setup({})
end
return {{"brenoprata10/nvim-highlight-colors", config = _1_}}
