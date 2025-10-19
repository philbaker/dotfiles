(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "x" :texthl error})
    (vim.fn.sign_define warn  {:text "!" :texthl warn})
    (vim.fn.sign_define info  {:text "i" :texthl info})
    (vim.fn.sign_define hint  {:text "?" :texthl hint})))

(define-signs "Diagnostic")

(fn on_attach [_client bufnr]
  (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lr "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lp "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
  ; Telescope
  (nvim.buf_set_keymap bufnr :n :<leader>la ":lua require('telescope.builtin').diagnostics()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lb ":lua require('telescope.builtin').lsp_references()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>lc ":lua require('telescope.builtin').lsp_implementations()<CR>" {:noremap true})
  (nvim.buf_set_keymap bufnr :n :<leader>ls ":lua require('telescope.builtin').lsp_document_symbols()<CR>" {:noremap true}))

(local cmplsp (require :cmp_nvim_lsp))

(local handlers {"textDocument/publishDiagnostics"
                 (vim.lsp.with
                   vim.lsp.diagnostic.on_publish_diagnostics
                   {:severity_sort true
                    :update_in_insert false
                    :underline true
                    :virtual_text false})
                 "textDocument/hover"
                 (vim.lsp.with
                   vim.lsp.handlers.hover
                   {:border "single"})
                 "textDocument/signatureHelp"
                 (vim.lsp.with
                   vim.lsp.handlers.signature_help
                   {:border "single"})})

(local capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities)))

(local defaults {:on_attach on_attach
                 :handlers handlers
                 :capabilities capabilities})

(tset vim.lsp.config :phpactor {:on_attach on_attach
                                :init_options {"language_server_phpstan.enabled" true}})
(tset vim.lsp.config :tailwindcss
      {:on_attach on_attach
       :filetypes ["html" "markdown" "php" "blade" "css" "postcss" "sass" "scss" "javascript" "javascriptreact" "typescript" "typescriptreact" "vue" "svelte" "clojure"]
       :settings
       ; https://github.com/tailwindlabs/tailwindcss-intellisense/issues/400#issuecomment-1218494303
       {:tailwindCSS {:experimental {:classRegex [":class\\s+\"([^\"]*)\"" ":className\\s+\"([^\"]*)\"" ":[\\w-.#>]+\\.([\\w-]*)" ":class\\s+\\[(.*?)\\]"]}}}})

(tset vim.lsp.config :eslint defaults)
(tset vim.lsp.config :cssls defaults)
(tset vim.lsp.config :fennel_ls defaults)
(tset vim.lsp.config :lua_ls defaults)
(tset vim.lsp.config :jdtls defaults)

(local vue-language-server-path
  (.. (vim.fn.expand "$MASON/packages/vue-language-server")
      "/node_modules/@vue/language-server"))

(local vue-plugin
  {:name "@vue/typescript-plugin"
   :location vue-language-server-path
   :languages ["vue"]
   :configNamespace "typescript"})

(local vtsls-config
  {:settings {:vtsls {:tsserver {:globalPlugins [vue-plugin]}}}
   :filetypes ["vue"]})

;; If you are on most recent `nvim-lspconfig`
(local vue-ls-config {})

(vim.lsp.config "vtsls" vtsls-config)
(vim.lsp.config "vue_ls" vue-ls-config)
(vim.lsp.enable ["vtsls" "vue_ls"])

(vim.lsp.enable "clojure_lsp")
(vim.lsp.enable "eslint")
(vim.lsp.enable "cssls")
(vim.lsp.enable "fennel_ls")
(vim.lsp.enable "lua_ls")
(vim.lsp.enable "jdtls")
(vim.lsp.enable "tailwindcss")
(vim.lsp.enable "phpactor")
