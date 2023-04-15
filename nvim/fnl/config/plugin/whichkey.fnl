(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             which-key which-key}})

(set vim.o.timeoutlen 300)

(which-key.setup)

(which-key.register {:t {:name "Fuzzy file"
                         :. ["Last search"]
                         :b ["Documentation"]
                         :d ["Dotfiles"]
                         :e ["Files"]
                         :h ["Help"]
                         :j ["Jumplist"]
                         :n ["Neotes"]
                         :m ["Marks"]
                         :o ["Autocommands"]
                         :p ["Projects"]
                         :q ["Quickfix list"]
                         :y ["Neoclip"]}
                     :a {:name "Fuzzy grep"
                         :a ["Grep"]
                         :d ["Dotfiles grep"]
                         :n ["Neotes grep"]
                         :r ["Grep with args"]}
                     :tt {:name "Test"}
                     :g {:name "Git"}
                     :e {:name "Terminal"}
                     :c {:name "LSP"}
                     :gh {:name "GitGutter"}} 
                    {:prefix "<leader>"})
