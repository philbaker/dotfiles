-- [nfnl] Compiled from fnl/plugins/nvim-paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local paredit = require("nvim-paredit")
  local function _2_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor("( ", ")"), {placement = "inner_start", mode = "insert"})
  end
  local function _3_()
    return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor("(", ")"), {placement = "inner_end", mode = "insert"})
  end
  return paredit.setup({keys = {["<localleader>i"] = {_2_, "Wrap form insert head"}, ["<localleader>I"] = {_3_, "Wrap form insert tail"}}})
end
return {{"julienvincent/nvim-paredit", config = _1_}}
