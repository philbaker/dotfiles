-- [nfnl] Compiled from fnl/plugins/nvim-lspconfig.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "x", texthl = error})
  vim.fn.sign_define(warn, {text = "!", texthl = warn})
  vim.fn.sign_define(info, {text = "i", texthl = info})
  return vim.fn.sign_define(hint, {text = "?", texthl = hint})
end
define_signs("Diagnostic")
local function _2_()
  local lsp = require("lspconfig")
  local cmplsp = require("cmp_nvim_lsp")
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, virtual_text = false, update_in_insert = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _3_(client, bufnr)
    nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>la", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lb", ":lua require('telescope.builtin').lsp_references()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lc", ":lua require('telescope.builtin').lsp_implementations()<CR>", {noremap = true})
    return nvim.buf_set_keymap(bufnr, "n", "<leader>ls", ":lua require('telescope.builtin').lsp_document_symbols()<CR>", {noremap = true})
  end
  on_attach = _3_
  local defaults = {on_attach = on_attach, handlers = handlers, capabilities = capabilities}
  lsp.clojure_lsp.setup(defaults)
  lsp.tsserver.setup(defaults)
  lsp.eslint.setup(defaults)
  lsp.svelte.setup(defaults)
  lsp.cssls.setup(defaults)
  lsp.pylsp.setup(defaults)
  lsp.fennel_ls.setup(defaults)
  return lsp.lua_ls.setup(defaults)
end
return {{"neovim/nvim-lspconfig", config = _2_}}
