[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn [_ opts]
            (let [treesitter (require :nvim-treesitter.configs)
                  parser-config ((. (require :nvim-treesitter.parsers) :get_parser_configs))]
              (set parser-config.blade
                   {:filetype :blade
                    :install_info {:branch :main
                                   :files [:src/parser.c]
                                   :url "https://github.com/EmranMR/tree-sitter-blade"}})
              (vim.filetype.add {:pattern {".*%.blade%.php" :blade}})
              (treesitter.setup {:highlight {:enable true}
                                 :matchup {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed ["html"
                                                    "css"
                                                    "javascript"
                                                    "typescript"
                                                    "clojure"
                                                    "lua"
                                                    "php"
                                                    "regex"
                                                    "yaml"
                                                    "svelte"
                                                    "fennel"
                                                    ; "markdown"
                                                    "python"
                                                    "java"
                                                    "vue"
                                                    "c"
                                                    "vim"
                                                    "vimdoc"]})))}]
