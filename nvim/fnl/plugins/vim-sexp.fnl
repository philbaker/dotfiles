(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :philbaker/vim-sexp
    :init (fn []
            (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))}]
