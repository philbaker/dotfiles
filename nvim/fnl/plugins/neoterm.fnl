(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local util (autoload :config.util))

[{1 :kassio/neoterm
    :config (fn []
              ; Defaults
              (nvim.ex.let "g:neoterm_autoscroll = 1")
              (nvim.ex.let "g:neoterm_size = 10")

              ; Send to REPL (visual mode)
              (util.set-key :<leader>E "<Plug>(neoterm-repl-send)" false :v))}]
