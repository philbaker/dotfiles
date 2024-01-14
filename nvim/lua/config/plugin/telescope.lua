local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/telescope.fnl"
local _2amodule_name_2a = "config.plugin.telescope"
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
local actions, layout, lga_actions, telescope = autoload("telescope.actions"), autoload("telescope.actions.layout"), autoload("telescope-live-grep-args.actions"), autoload("telescope")
do end (_2amodule_locals_2a)["actions"] = actions
_2amodule_locals_2a["layout"] = layout
_2amodule_locals_2a["lga-actions"] = lga_actions
_2amodule_locals_2a["telescope"] = telescope
telescope.setup({defaults = {file_ignore_patterns = {"node_modules", "public/vendor", "public/js/vendor"}, mappings = {i = {["<c-l>"] = (actions.send_to_qflist + actions.open_qflist), ["<c-r>"] = actions.close, ["<c-n>"] = actions.cycle_history_next, ["<c-p>"] = actions.cycle_history_prev, ["?"] = layout.toggle_preview}}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden", "--no-ignore-vcs"}}}, extensions = {live_grep_args = {auto_quoting = true, mappings = {i = {["<c-i>"] = lga_actions.quote_prompt({postfix = " --iglob "}), ["<c-k>"] = lga_actions.quote_prompt()}}}}})
telescope.load_extension("live_grep_args")
telescope.load_extension("project")
telescope.load_extension("neoclip")
return _2amodule_2a