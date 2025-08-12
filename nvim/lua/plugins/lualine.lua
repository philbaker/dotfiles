-- [nfnl] fnl/plugins/lualine.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
local function lsp_connection()
  if vim.tbl_isempty(vim.lsp.get_clients(0)) then
    return "\239\130\150"
  else
    return "\239\131\136"
  end
end
local github_lua_theme = core.assoc(require("lualine.themes.auto"), "inactive", {a = {bg = "#19181e", fg = "#a4a3a6"}, b = {bg = "#19181e", fg = "#a4a3a6"}, c = {bg = "#19181e", fg = "#a4a3a6"}}, "normal", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#3b8eea"}, c = {bg = "#19181e", fg = "#d1d5da"}}, "command", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#ccbed8"}, c = {bg = "#19181e", fg = "#d1d5da"}}, "terminal", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#ccbed8"}, c = {bg = "#19181e", fg = "#d1d5da"}}, "visual", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#ced4b1"}, c = {bg = "#19181e", fg = "#d1d5da"}}, "replace", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#d1b6bd"}, c = {bg = "#19181e", fg = "#d1d5da"}}, "insert", {a = {bg = "#131217", fg = "#24292e"}, b = {bg = "#131217", fg = "#a8d1c9"}, c = {bg = "#19181e", fg = "#d1d5da"}})
local function _3_()
  local lualine = require("lualine")
  return lualine.setup({options = {theme = github_lua_theme, icons_enabled = true, section_separators = {"", ""}, component_separators = {"\239\145\138", "\239\144\184"}}, sections = {lualine_a = {}, lualine_b = {{"mode", {upper = true}}}, lualine_c = {{"FugitiveHead"}, {"orgmode.statusline()"}, {"tostring(string.gsub(vim.fn.getcwd(), os.getenv('HOME'), ''))"}, {"filename", {filestatus = true, path = 1}}}, lualine_x = {{"diagnostics", {sections = {"error", "warn", "info", "hint"}, sources = {"nvim_lsp"}}}, {lsp_connection}, "location", "filetype"}, lualine_y = {"encoding"}, lualine_z = {}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", {filestatus = true, path = 1}}}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
end
return {{"nvim-lualine/lualine.nvim", config = _3_}}
