-- [nfnl] Compiled from fnl/plugins/mason-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  mason.setup()
  return mason_lspconfig.setup({ensure_installed = {"clojure_lsp", "cssls", "eslint", "phpactor", "lua_ls", "tailwindcss", "ts_ls", "volar", "jdtls"}})
end
return {{"williamboman/mason-lspconfig.nvim", dependencies = {"williamboman/mason.nvim"}, init = _1_}}
