(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local nvim-comment (require "nvim_comment"))

[{1 :terrortylor/nvim-comment
  :init (fn []
          (nvim-comment.setup
            {:hook (fn []
                     ((. (require :ts_context_commentstring.internal)
                         :update_commentstring)))}))}]
