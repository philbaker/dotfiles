-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local layout = require("telescope.actions.layout")
  local builtin = require("telescope.builtin")
  local lga_actions = require("telescope-live-grep-args.actions")
  telescope.setup({defaults = {mappings = {i = {["<c-l>"] = (actions.send_to_qflist + actions.open_qflist), ["<c-r>"] = actions.close, ["<c-n>"] = actions.cycle_history_next, ["<c-p>"] = actions.cycle_history_prev, ["?"] = layout.toggle_preview}}}, pickers = {find_files = {find_command = {"rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*", "--glob", "!**/.clj-kondo", "--glob", "!**/.clerk", "--glob", "!**/.lsp", "--glob", "!**/.cpcache"}}}})
  vim.keymap.set("n", "<leader>ti", builtin.find_files, {desc = "Find file"})
  vim.keymap.set("n", "<leader>te", builtin.git_files, {desc = "Open git files"})
  telescope.load_extension("live_grep_args")
  telescope.load_extension("project")
  telescope.load_extension("git_file_history")
  return telescope.load_extension("undo")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim", "nvim-telescope/telescope-project.nvim", {"isak102/telescope-git-file-history.nvim", dependencies = {"tpope/vim-fugitive"}}, "debugloop/telescope-undo.nvim"}, config = _2_}}
