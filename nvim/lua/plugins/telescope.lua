-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local layout = require("telescope.actions.layout")
  local lga_actions = require("telescope-live-grep-args.actions")
  telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}, mappings = {i = {["<c-l>"] = (actions.send_to_qflist + actions.open_qflist), ["<c-r>"] = actions.close, ["<c-n>"] = actions.cycle_history_next, ["<c-p>"] = actions.cycle_history_prev, ["?"] = layout.toggle_preview}}}}, "pickers", {find_files = {find_command = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--hidden"}}})
  telescope.load_extension("live_grep_args")
  telescope.load_extension("project")
  return telescope.load_extension("neoclip")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim", "nvim-telescope/telescope-project.nvim"}, config = _2_}}
