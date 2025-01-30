-- [nfnl] Compiled from fnl/plugins/mason-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local mason_lspconfig = require("mason-lspconfig")
  return mason_lspconfig.setup({ensure_installed = {"clojure_lsp", "cssls", "eslint", "phpactor", "phpstan", "lua_ls", "tailwindcss", "ts_ls", "volar"}})
end
return {{"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, init = _1_}}
