-- [nfnl] Compiled from fnl/config/util.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
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
local function remove_all_spaces(str)
  return tostring(string.gsub(str, "%s+", ""))
end
local function nbb_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return remove_all_spaces(vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args)))
end
local function nbb_script_spaces(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/nbbs/")
  return vim.fn.system(("nbb " .. scripts_dir .. script .. ".cljs " .. args))
end
local function node_script(script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/")
  return remove_all_spaces(vim.fn.system(("node " .. scripts_dir .. script .. args)))
end
local function replace_pixel_rem()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("pixel_to_rem", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_rem_pixel()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("rem_to_pixel", tostring(current_word))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_hex_rgb()
  local current_word = vim.call("expand", "<cword>")
  local replacement = nbb_script("hex_to_rgb", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diwi" .. replacement))
end
local function replace_rgb_hex()
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = nbb_script("rgb_to_hex", ("\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
local function tailwind_colors(arg)
  local current_word = vim.call("expand", "<cWORD>")
  local replacement = node_script("tw-colors/index.mjs", (" " .. arg .. " " .. "\"" .. tostring(current_word) .. "\""))
  return vim.cmd(("normal! diWi" .. replacement))
end
local function tailwind_class_to_hex()
  return tailwind_colors("ch")
end
local function tailwind_hex_to_class()
  return tailwind_colors("hc")
end
local function system_os()
  return vim.loop.os_uname().sysname
end
local function insert_optimised_svg(file_name, id)
  local function _3_()
    if id then
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name .. id))
    else
      return nbb_script_spaces("svg_to_symbol", (os.getenv("HOME") .. "/Downloads/" .. file_name))
    end
  end
  return vim.api.nvim_buf_set_lines(0, -1, -1, false, split_string_by_line(_3_()))
end
local function set_key(key, action, noremap, _3fmode)
  return nvim.set_keymap((_3fmode or "n"), key, action, {noremap = noremap})
end
local function set_uc(name, command, _3fopts)
  return vim.api.nvim_create_user_command(name, command, (_3fopts or {bang = false}))
end
local function getcwf()
  return tostring(string.gsub(vim.fn.getcwd(), os.getenv("HOME"), ""))
end
local function cmdtc(cmd)
  return vim.cmd(vim.api.nvim_replace_termcodes(("normal " .. cmd), true, true, true))
end
return {["split-string-by-line"] = split_string_by_line, ["remove-all-spaces"] = remove_all_spaces, ["nbb-script"] = nbb_script, ["nbb-script-spaces"] = nbb_script_spaces, ["node-script"] = node_script, ["replace-pixel-rem"] = replace_pixel_rem, ["replace-rem-pixel"] = replace_rem_pixel, ["replace-hex-rgb"] = replace_hex_rgb, ["replace-rgb-hex"] = replace_rgb_hex, ["tailwind-colors"] = tailwind_colors, ["tailwind-class-to-hex"] = tailwind_class_to_hex, ["tailwind-hex-to-class"] = tailwind_hex_to_class, ["insert-optimised-svg"] = insert_optimised_svg, ["system-os"] = system_os, ["set-uc"] = set_uc, ["set-key"] = set_key, getcwf = getcwf, cmdtc = cmdtc}
