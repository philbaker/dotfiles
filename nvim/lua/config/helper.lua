local _2afile_2a = "/home/pb/.config/nvim/fnl/config/helper.fnl"
local _2amodule_name_2a = "config.helper"
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
local function ag_outside_cwd(dir, args)
  local current_dir = vim.fn.getcwd()
  vim.api.nvim_set_current_dir((os.getenv("HOME") .. dir))
  vim.cmd((":AgRaw -u " .. args))
  return vim.api.nvim_set_current_dir(current_dir)
end
_2amodule_2a["ag-outside-cwd"] = ag_outside_cwd
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
local function keymap(key, action, _3fmode, _3fnoremap)
  return nvim.set_keymap((_3fmode or "n"), key, action, {noremap = (_3fnoremap or false)})
end
_2amodule_2a["keymap"] = keymap
return _2amodule_2a