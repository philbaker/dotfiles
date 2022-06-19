(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#hud#ignore_low_priority "v:true")

; Pretty print maps with syntax highlighting
(nvim.set_keymap :n :<localleader>za "ysaf)aclojure.pprint/pprint<ESC><localleader>eru" {:noremap false})
(nvim.set_keymap :n :<localleader>zb "kf}V%:s/; (out) /<CR>f}%:noh<CR>" {:noremap false})

