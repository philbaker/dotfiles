-- [nfnl] Compiled from fnl/plugins/oil.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local oil = require("oil")
  oil.setup()
  return vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
end
return {{"stevearc/oil.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}, config = _1_}}
