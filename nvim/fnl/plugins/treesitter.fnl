[{1 :nvim-treesitter/nvim-treesitter
    :build ":TSUpdate"
    :config (fn []
              (let [treesitter (require :nvim-treesitter.configs)]
                (treesitter.setup {:highlight {:enable true}
                                  :matchup {:enable true
                                            :disable ["javascript"]}
                                  :indent {:enable true}
                                  :context_commentstring {:enable true}
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
                                                     "markdown"
                                                     "python"
                                                     "java"
                                                     "org"
                                                     "vue"]})))}]
