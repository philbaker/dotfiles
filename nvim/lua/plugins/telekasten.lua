-- [nfnl] fnl/plugins/telekasten.fnl
local function _1_()
  local telekasten = require("telekasten")
  local notes_dir = vim.fn.expand("~/neotes")
  return telekasten.setup({home = notes_dir})
end
return {{"renerocksai/telekasten.nvim", dependencies = {"nvim-telescope/telescope.nvim"}, config = _1_}}
