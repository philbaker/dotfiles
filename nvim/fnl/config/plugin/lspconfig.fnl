(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

; Symbols to show for lsp diagnostics
(defn define-signs
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

; Server features
(let [handlers {"textDocument/publishDiagnostics"
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
                  {:border "single"})}
      capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cd "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ct "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ch "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cn "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ce "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cf "<cmd>lua vim.lsp.buf.formatting()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ck "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
                    ; Telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>ca ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>ca ":'<,'>:Telescope lsp_range_code_actions theme=cursor<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>cr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ci ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]

  (def- defaults {:on_attach on_attach
                  :handlers handlers
                  :capabilities capabilities})

  (lsp.clojure_lsp.setup defaults)
  (lsp.tsserver.setup defaults)
  (lsp.eslint.setup defaults)
  (lsp.svelte.setup defaults)
  (lsp.cssls.setup defaults)
  (lsp.pylsp.setup defaults)

  (lsp.elixirls.setup {:cmd [(.. (os.getenv "HOME") "/elixirls/language_server.sh")]
                       :on_attach on_attach
                       :handlers handlers
                       :capabilities capabilities})

  (lsp.intelephense.setup {:on_attach on_attach
                           :flags [:debounce_text_changes 500]
                           :init_options [:licenceKey (.. (os.getenv "HOME") "/intelephense/licence.txt")]
                           :handlers handlers
                           :capabilities capabilities})

  (lsp.tailwindcss.setup {:on_attach on_attach
                          :handlers handlers
                          :capabilities capabilities
                          :filetypes ["html" "markdown" "php" "css" "postcss" "sass" "scss" "javascript" "javascriptreact" "typescript" "typescriptreact" "vue" "svelte" "clojure"]
                          :settings
                          ; https://github.com/tailwindlabs/tailwindcss-intellisense/issues/400#issuecomment-1218494303
                          {:tailwindCSS {:experimental {:classRegex [":class\\s+\"([^\"]*)\"" ":className\\s+\"([^\"]*)\"" ":[\\w-.#>]+\\.([\\w-]*)"]}}}})
  
  (lsp.java_language_server.setup {:cmd [(.. (os.getenv "HOME") "/java-language-server/dist/lang_server_linux.sh")]
                                   :on_attach on_attach
                                   :handlers handlers
                                   :capabilities capabilities}))
