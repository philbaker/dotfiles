local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/cmp.fnl"
local _2amodule_name_2a = "config.plugin.cmp"
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
local cmp = autoload("cmp")
do end (_2amodule_locals_2a)["cmp"] = cmp
local cmp_src_menu_items = {vsnip = "vsnip", nvim_lsp = "lsp", conjure = "conj", path = "path"}
_2amodule_locals_2a["cmp-src-menu-items"] = cmp_src_menu_items
local cmp_srcs = {{name = "vsnip"}, {name = "nvim_lsp"}, {name = "conjure"}, {name = "path"}}
_2amodule_locals_2a["cmp-srcs"] = cmp_srcs
local function _1_(entry, item)
  item.menu = (cmp_src_menu_items[entry.source.name] or "")
  return item
end
local function _2_(args)
  return vim.fn["vsnip#anonymous"](args.body)
end
cmp.setup({formatting = {format = _1_}, mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = false})}, snippet = {expand = _2_}, sources = cmp_srcs})
return _2amodule_2a