-- [nfnl] fnl/config/lsp.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
vim.lsp.enable("clojure_lsp")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("cssls")
vim.lsp.enable("fennel_ls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("jdtls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("vue_ls")
return vim.lsp.enable("phpactor")
