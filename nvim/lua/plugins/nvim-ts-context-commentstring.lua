-- [nfnl] Compiled from fnl/plugins/nvim-ts-context-commentstring.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(node, language_tree)
  if ((vim.bo.filetype == "blade") and (language_tree._lang ~= "javascript")) then
    return "{{-- %s --}}"
  else
    return nil
  end
end
return {{"JoosepAlviste/nvim-ts-context-commentstring", opts = {custom_calculation = _1_}}}
