-- [nfnl] Compiled from fnl/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
if (vim.loop.os_uname().sysname == "Darwin") then
  local function _1_()
    vim.keymap.set("i", "<C-J>", "copilot#Accept(\"\\<CR>\")", {expr = true, replace_keycodes = false})
    vim.g.copilot_no_tab_map = true
    return nil
  end
  return {{"github/copilot.vim", event = "InsertEnter", config = _1_}}
else
  return {}
end
