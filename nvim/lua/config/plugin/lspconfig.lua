local _2afile_2a = "/home/pb/.config/nvim/fnl/config/plugin/lspconfig.fnl"
local _2amodule_name_2a = "config.plugin.lspconfig"
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
local cmplsp, lsp, nvim = autoload("cmp_nvim_lsp"), autoload("lspconfig"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["cmplsp"] = cmplsp
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
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
_2amodule_2a["define-signs"] = define_signs
define_signs("Diagnostic")
do
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, update_in_insert = false, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _1_(client, bufnr)
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
  on_attach = _1_
  local defaults = {on_attach = on_attach, handlers = handlers, capabilities = capabilities}
  _2amodule_locals_2a["defaults"] = defaults
  lsp.clojure_lsp.setup(defaults)
  lsp.tsserver.setup(defaults)
  lsp.eslint.setup(defaults)
  lsp.svelte.setup(defaults)
  lsp.cssls.setup(defaults)
  lsp.pylsp.setup(defaults)
  lsp.volar.setup({capabilities = capabilities, flags = {debounce_text_changes = 150}, init_options = {typescript = {tsdk = (os.getenv("HOME") .. "/.nvm/versions/node/v20.3.0/lib/node_modules/typescript/lib")}}, on_attach = on_attach, handlers = handlers, filetypes = {"vue"}})
  lsp.intelephense.setup({on_attach = on_attach, flags = {"debounce_text_changes", 500}, init_options = {"licenceKey", (os.getenv("HOME") .. "/intelephense/licence.txt")}, handlers = handlers, capabilities = capabilities})
  lsp.tailwindcss.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities, filetypes = {"html", "markdown", "php", "css", "postcss", "sass", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "clojure"}, settings = {tailwindCSS = {experimental = {classRegex = {":class\\s+\"([^\"]*)\"", ":className\\s+\"([^\"]*)\"", ":[\\w-.#>]+\\.([\\w-]*)"}}}}})
  lsp.java_language_server.setup({cmd = {(os.getenv("HOME") .. "/java-language-server/dist/lang_server_linux.sh")}, on_attach = on_attach, handlers = handlers, capabilities = capabilities})
end
return _2amodule_2a