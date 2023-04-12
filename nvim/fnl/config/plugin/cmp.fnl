(module config.plugin.cmp
  {autoload {cmp cmp}})

(def- cmp-src-menu-items
  {:vsnip "vsnip"
   :nvim_lsp "lsp"
   :conjure "conj"
   :path "path"})

(def- cmp-srcs
  [{:name :vsnip}
   {:name :nvim_lsp}
   {:name :conjure}
   {:name :path}])

;; Setup cmp with desired settings
(cmp.setup {:formatting
            {:format (fn [entry item]
                       (set item.menu (or (. cmp-src-menu-items entry.source.name) ""))
                       item)}
            :mapping {:<C-p> (cmp.mapping.select_prev_item)
                      :<C-n> (cmp.mapping.select_next_item)
                      :<C-b> (cmp.mapping.scroll_docs (- 4))
                      :<C-f> (cmp.mapping.scroll_docs 4)
                      :<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.close)
                      :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                  :select false})}
            :snippet {:expand (fn [args] ((. vim.fn "vsnip#anonymous") args.body))}
            :sources cmp-srcs})
