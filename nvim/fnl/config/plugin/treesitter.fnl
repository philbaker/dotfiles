(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(treesitter.setup {:highlight {:enable true
                               :disable ["org"]
                               :additional_vim_regex_highlighting ["org"]}
                   :matchup {:enable true
                             :disable ["javascript"]}
                   :indent {:enable true
                            :disable ["elixir"]}
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
                                      "svelte"
                                      "fennel"
                                      "markdown"
                                      "python"
                                      "java"
                                      "org"]})
