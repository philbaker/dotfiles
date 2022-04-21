(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true :disable ["elixir"]}
                   :indent {:enable true}
                   :ensure_installed ["html"
                                      "css"
                                      "javascript"
                                      "typescript"
                                      "graphql"
                                      "elixir"
                                      "clojure"
                                      "lua"
                                      "php"
                                      "regex"
                                      "yaml"
                                      "ruby"]})
