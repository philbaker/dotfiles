(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true}
                   :indent {:enable true}
                   :ensure_installed ["html"
                                      "css"
                                      "javascript"
                                      "typescript"
                                      "elixir"
                                      "heex"
                                      "clojure"
                                      "lua"
                                      "php"
                                      "regex"
                                      "yaml"
                                      "svelte"]})
