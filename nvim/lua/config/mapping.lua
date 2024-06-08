-- [nfnl] Compiled from fnl/config/mapping.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local util = autoload("config.util")
vim.o.timeoutlen = 500
util["set-key"]("<space>", "<nop>")
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
util["set-key"]("<S-Up>", "<C-w>+", true)
util["set-key"]("<S-Down>", "<C-w>-", true)
util["set-key"]("<S-Right>", "<C-w>>", true)
util["set-key"]("<S-Left>", "<C-w><", true)
util["set-key"]("<Esc>", "<C-\\><C-n>", false, "t")
util["set-key"]("<C-R>", "<C-R>", false)
util["set-key"]("<leader>r", ":s-\\%V \\%V-\\\" \\\"-g<CR>", false, "v")
return {}
