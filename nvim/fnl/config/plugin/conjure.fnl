(module config.plugin.conjure
  {autoload {nvim aniseed.nvim
             util config.util}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#hud#ignore_low_priority "v:true")
(set nvim.g.conjure#mapping#prefix "<leader>c")

; Stop Lua errors during eval comment
(util.set-key :<localleader>ecc "l<leader>cecr:sleep 10m<CR>f;hxi<CR><ESC>$" false)

(util.set-key :<leader>cdl "vie<m-e>y:ConjureEval (def <c-r>\")<cr>" false)
