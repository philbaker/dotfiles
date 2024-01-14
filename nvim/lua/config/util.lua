local _2afile_2a = "/home/pb/.config/nvim/fnl/config/util.fnl"
local _2amodule_name_2a = "config.util"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
local function split_string_by_line(str)
  local words = {}
  for line in string.gmatch(str, "([^\n]*)\n?") do
    if (string.len(line) ~= 0) then
      table.insert(words, line)
    else
    end
  end
  return words
end
_2amodule_2a["split-string-by-line"] = split_string_by_line
local function remove_all_spaces(str)
  return tostring(string.gsub(str, "%s+", ""))
end
_2amodule_2a["remove-all-spaces"] = remove_all_spaces
local function nbb_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return remove_all_spaces(vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args)))
end
_2amodule_2a["nbb-script"] = nbb_script
local function nbb_script_spaces(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args))
end
_2amodule_2a["nbb-script-spaces"] = nbb_script_spaces
local function node_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/")
  return remove_all_spaces(vim.fn.system(("node " .. scripts_dir .. script .. args)))
end
_2amodule_2a["node-script"] = node_script
local function replace_pixel_rem()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("pixel_to_rem", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
_2amodule_2a["replace-pixel-rem"] = replace_pixel_rem
local function replace_rem_pixel()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("rem_to_pixel", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
_2amodule_2a["replace-rem-pixel"] = replace_rem_pixel
local function replace_hex_rgb()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("hex_to_rgb", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diwi" .. replacement))
end
_2amodule_2a["replace-hex-rgb"] = replace_hex_rgb
local function replace_rgb_hex()
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = nbb_script("rgb_to_hex", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
_2amodule_2a["replace-rgb-hex"] = replace_rgb_hex
local function tailwind_colors(arg)
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = node_script("tw-colors/index.mjs", (" " .. arg .. " " .. "\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
_2amodule_2a["tailwind-colors"] = tailwind_colors
local function tailwind_class_to_hex()
  return tailwind_colors("ch")
end
_2amodule_2a["tailwind-class-to-hex"] = tailwind_class_to_hex
local function tailwind_hex_to_class()
  return tailwind_colors("hc")
end
_2amodule_2a["tailwind-hex-to-class"] = tailwind_hex_to_class
local function system_os()
  return vim.loop.os_uname().sysname
end
_2amodule_2a["system-os"] = system_os
local function insert_optimised_svg(file_name, id)
  local function _2_()
    if id then
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name .. id))
    else
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name))
    end
  end
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, split_string_by_line(_2_()))
end
_2amodule_2a["insert-optimised-svg"] = insert_optimised_svg
local function set_key(key, action, noremap, _3fmode)
  return nvim.set_keymap((_3fmode or "n"), key, action, {noremap = noremap})
end
_2amodule_2a["set-key"] = set_key
local function set_uc(name, command, _3fopts)
  return vim.api.nvim_create_user_command(name, command, (_3fopts or {bang = false}))
end
_2amodule_2a["set-uc"] = set_uc
local function getcwf()
  return tostring(string.gsub(vim.fn.getcwd(), os.getenv("HOME"), ""))
end
_2amodule_2a["getcwf"] = getcwf
local function cmdtc(cmd)
  return vim.cmd(vim.api.nvim_replace_termcodes(("normal " .. cmd), true, true, true))
end
_2amodule_2a["cmdtc"] = cmdtc
return _2amodule_2a