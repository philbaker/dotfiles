local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/treesitter.fnl"
local _2amodule_name_2a = "config.plugin.treesitter"
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
local treesitter = autoload("nvim-treesitter.configs")
do end (_2amodule_locals_2a)["treesitter"] = treesitter
treesitter.setup({highlight = {enable = true}, matchup = {enable = true, disable = {"javascript"}}, indent = {enable = true}, context_commentstring = {enable = true}, ensure_installed = {"html", "css", "javascript", "typescript", "clojure", "lua", "php", "regex", "yaml", "svelte", "fennel", "markdown", "python", "java", "org", "vue"}})
return _2amodule_2a