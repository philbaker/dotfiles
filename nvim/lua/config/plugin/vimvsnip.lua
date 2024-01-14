local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/vimvsnip.fnl"
local _2amodule_name_2a = "config.plugin.vimvsnip"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.g.vsnip_snippet_dir = "~/dotfiles/nvim/snippets"
vim.api.nvim_command("imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>'")
vim.api.nvim_command("imap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")
vim.api.nvim_command("smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'")
vim.api.nvim_command("smap <expr> <C-l> vsnip#available() ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")
vim.api.nvim_command("imap <expr> <C-n> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-n>'")
vim.api.nvim_command("smap <expr> <C-n> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-n>'")
vim.api.nvim_command("imap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'")
vim.api.nvim_command("smap <expr> <C-p> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-p>'")
return _2amodule_2a