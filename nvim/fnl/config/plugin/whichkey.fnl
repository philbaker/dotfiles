(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             which-key which-key}})

(set vim.o.timeoutlen 300)

(which-key.setup)

(which-key.register 
  {:. "Buffer list"
   :<CR> "Clear highlights"
   :a {:name "Fuzzy grep"
       :a "Grep"
       :d "Dotfiles grep"
       :n "Neotes grep"
       :r "Grep with args"}
   :c {:name "LSP"}
   :e {:name "Terminal"}
   :f "Undo tree"
   :g {:name "Git"}
   :gh {:name "GitGutter"}
   :m "Zoom current split"
   :p "Prettier"
   :r "Send to REPL"
   :s "Save"
   :t {:name "Fuzzy file"
       :. "Last search"
       :b "Documentation"
       :d "Dotfiles"
       :e "Files"
       :h "Help"
       :j "Jumplist"
       :n "Neotes"
       :m "Marks"
       :o "Autocommands"
       :p "Projects"
       :q "Quickfix list"
       :y "Neoclip"}
   :tt {:name "Test"}
   :u "Previous buffer"} 
  {:prefix "<leader>"})
