[{1 :williamboman/mason-lspconfig.nvim
  :dependencies [:williamboman/mason.nvim]
  :init (fn []
          (let [mason-lspconfig (require "mason-lspconfig")]
            (mason-lspconfig.setup {:ensure_installed ["clojure_lsp"
                                                       "cssls"
                                                       "eslint"
                                                       "phpactor"
                                                       "lua_ls"
                                                       "tailwindcss"
                                                       "ts_ls"
                                                       "volar"]})))}]
