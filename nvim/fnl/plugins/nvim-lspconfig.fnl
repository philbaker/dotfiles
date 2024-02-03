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

[{1 :neovim/nvim-lspconfig
  :config (fn []
            (let [lsp (require :lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  handlers {"textDocument/publishDiagnostics"
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
                                (nvim.buf_set_keymap bufnr :n :<leader>la ":lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>" {:noremap true})
                                (nvim.buf_set_keymap bufnr :n :<leader>lb ":lua require('telescope.builtin').lsp_references()<CR>" {:noremap true})
                                (nvim.buf_set_keymap bufnr :n :<leader>lc ":lua require('telescope.builtin').lsp_implementations()<CR>" {:noremap true})
                                (nvim.buf_set_keymap bufnr :n :<leader>ls ":lua require('telescope.builtin').lsp_document_symbols()<CR>" {:noremap true})))]

              (local defaults {:on_attach on_attach
                               :handlers handlers
                               :capabilities capabilities})

              (lsp.clojure_lsp.setup defaults)
              (lsp.tsserver.setup defaults)
              (lsp.eslint.setup defaults)
              (lsp.svelte.setup defaults)
              (lsp.cssls.setup defaults)
              (lsp.pylsp.setup defaults)
              (lsp.fennel_ls.setup defaults)
              (lsp.lua_ls.setup defaults)
              (lsp.intelephense.setup defaults)
              (lsp.tailwindcss.setup 
                {:on_attach on_attach
                 :handlers handlers
                 :capabilities capabilities
                 :filetypes ["html" "markdown" "php" "css" "postcss" "sass" "scss" "javascript" "javascriptreact" "typescript" "typescriptreact" "vue" "svelte" "clojure"]
                 :settings
                 ; https://github.com/tailwindlabs/tailwindcss-intellisense/issues/400#issuecomment-1218494303
                 {:tailwindCSS {:experimental {:classRegex [":class\\s+\"([^\"]*)\"" ":className\\s+\"([^\"]*)\"" ":[\\w-.#>]+\\.([\\w-]*)"]}}}})))}]
