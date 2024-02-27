-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_(_, opts)
  local treesitter = require("nvim-treesitter.configs")
  local parser_config = (require("nvim-treesitter.parsers")).get_parser_configs()
  parser_config.blade = {filetype = "blade", install_info = {branch = "main", files = {"src/parser.c"}, url = "https://github.com/EmranMR/tree-sitter-blade"}}
  vim.filetype.add({pattern = {[".*%.blade%.php"] = "blade"}})
  return treesitter.setup({highlight = {enable = true}, matchup = {enable = true, disable = {"javascript"}}, indent = {enable = true}, ensure_installed = {"html", "css", "javascript", "typescript", "clojure", "lua", "php", "regex", "yaml", "svelte", "fennel", "markdown", "python", "java", "org", "vue"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
