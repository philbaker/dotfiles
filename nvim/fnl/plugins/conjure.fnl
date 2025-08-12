(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :Olical/conjure
  :branch "main"
  :init (fn []
          (set nvim.g.conjure#mapping#doc_word "K")
          (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (set nvim.g.conjure#hud#ignore_low_priority "v:true")
          (set nvim.g.conjure#mapping#prefix "<leader>c")
          (set nvim.g.conjure#client#javascript#stdio#command "deno"))}]
