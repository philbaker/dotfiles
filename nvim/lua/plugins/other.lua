-- [nfnl] Compiled from fnl/plugins/other.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(path)
  local m = vim.fn.matchlist(path, "\\v^(.*)/src/(.{-}_test)@!(.{-}).clj(.?)")
  if (#m > 0) then
    return m
  else
    return nil
  end
end
return {{"rgroli/other.nvim", main = "other-nvim", opts = {mappings = {"livewire", "laravel", "react", {context = "test", pattern = _1_, target = "%2/test/%4_test.clj%5"}, {context = "implementation", pattern = "(.*)/test/(.*)_test.clj(.?)$", target = "%1/src/%2.clj%3"}}}}}
