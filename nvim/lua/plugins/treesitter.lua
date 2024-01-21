-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, matchup = {enable = true, disable = {"javascript"}}, indent = {enable = true}, context_commentstring = {enable = true}, ensure_installed = {"html", "css", "javascript", "typescript", "clojure", "lua", "php", "regex", "yaml", "svelte", "fennel", "markdown", "python", "java", "org", "vue"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
