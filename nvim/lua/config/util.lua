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
--[[ (tailwind-color "ch" "red-100") (tailwind-color "cr" "red-100") (tailwind-color "hc" "#fee2e2") (tailwind-color "rc" "rgb(254, 226, 226)") ]]
return {["split-string-by-line"] = split_string_by_line, ["remove-all-spaces"] = remove_all_spaces, ["nbb-script"] = __fnl_global__nbb_2dscript, ["nbb-script-spaces"] = __fnl_global__nbb_2dscript_2dspaces, ["node-script"] = __fnl_global__node_2dscript, ["replace-pixel-rem"] = __fnl_global__replace_2dpixel_2drem, ["replace-rem-pixel"] = __fnl_global__replace_2drem_2dpixel, ["replace-hex-rgb"] = __fnl_global__replace_2dhex_2drgb, ["replace-rgb-hex"] = __fnl_global__replace_2drgb_2dhex, ["tailwind-colors"] = __fnl_global__tailwind_2dcolors, ["tailwind-class-to-hex"] = __fnl_global__tailwind_2dclass_2dto_2dhex, ["tailwind-hex-to-class"] = __fnl_global__tailwind_2dhex_2dto_2dclass, ["insert-optimised-svg"] = __fnl_global__insert_2doptimised_2dsvg, ["system-os"] = system_os, ["set-uc"] = set_uc, ["set-key"] = set_key, getcwf = getcwf, cmdtc = cmdtc}
