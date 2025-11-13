-- [nfnl] fnl/plugins/harpoon.fnl
local function _1_()
  local harpoon = require("harpoon")
  return harpoon.setup({menu = {width = (vim.api.nvim_win_get_width(0) - 8)}})
end
return {{"ThePrimeagen/harpoon", config = _1_}}
