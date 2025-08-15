-- [nfnl] fnl/plugins/orgmode.fnl
local function _1_()
  local orgmode = require("orgmode")
  local _2_
  if (vim.loop.os_uname().sysname == "Darwin") then
    _2_ = "~/org-sync/tasks.org"
  else
    _2_ = "~/org-sync/laptop.org"
  end
  return orgmode.setup({org_agenda_files = "~/org-sync/*", org_default_notes_file = _2_, org_todo_keywords = {"REPEAT", "TODO", "NEXT", "ACTIVE", "WAITING", "SOMEDAY", "PROJ", "|", "DONE", "CANCELLED", "COMPLETED"}})
end
return {{"nvim-orgmode/orgmode", event = "VeryLazy", ft = {"org"}, config = _1_}}
