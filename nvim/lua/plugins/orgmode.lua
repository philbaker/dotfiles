-- [nfnl] Compiled from fnl/plugins/orgmode.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local orgmode = require("orgmode")
  return orgmode.setup({org_agenda_files = "~/orgfiles/*", org_default_notes_file = "~/orgfiles/tasks.org", org_todo_keywords = {"REPEAT", "TODO", "NEXT", "ACTIVE", "WAITING", "SOMEDAY", "PROJ", "|", "DONE", "CANCELLED", "COMPLETED"}})
end
return {{"nvim-orgmode/orgmode", event = "VeryLazy", ft = {"org"}, config = _1_}}
