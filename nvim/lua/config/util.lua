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
local function system_os()
  return vim.loop.os_uname().sysname
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
local function call_script_21(command, script, args)
  local scripts_dir = (os.getenv("HOME") .. "/dotfiles/scripts/")
  return vim.fn.system((command .. " " .. scripts_dir .. script .. args))
end
local function tailwind_color(arg, color)
  return remove_all_spaces(call_script_21("node", "tw-colors/index.mjs", (" " .. arg .. " " .. "\"" .. tostring(color) .. "\"")))
end
local function pixel__3erem(val)
  return (val / 16)
end
local function rem__3epixel(val)
  return (val * 16)
end
local function hex__3ergb(val)
  return remove_all_spaces(call_script_21("nbb", "nbbs/hex_to_rgb.cljs", (" " .. "\"" .. tostring(val) .. "\"")))
end
local function rgb__3ehex(val)
  return remove_all_spaces(call_script_21("nbb", "nbbs/rgb_to_hex.cljs", (" " .. "\"" .. tostring(val) .. "\"")))
end
return {["split-string-by-line"] = split_string_by_line, ["remove-all-spaces"] = remove_all_spaces, ["call-script!"] = call_script_21, ["system-os"] = system_os, ["set-uc"] = set_uc, ["set-key"] = set_key, getcwf = getcwf, cmdtc = cmdtc, ["tailwind-color"] = tailwind_color, ["pixel->rem"] = pixel__3erem, ["rem->pixel"] = rem__3epixel, ["rgb->hex"] = rgb__3ehex, ["hex->rgb"] = hex__3ergb}
