(module config.plugin.conjure
  {autoload {nvim aniseed.nvim
             util config.util}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#hud#ignore_low_priority "v:true")

; Pretty print maps with syntax highlighting
(util.set-key :<localleader>za "ysaf)aclojure.pprint/pprint<ESC><localleader>eru" false)
(util.set-key :<localleader>zb "kf}V%:s/; (out) /<CR>f}%:noh<CR>" false)

; Stop Lua errors during eval comment
(util.set-key :n :<localleader>ecc "^l<localleader>ecr:sleep 10m<CR>f;hxi<CR><ESC>$" false)
