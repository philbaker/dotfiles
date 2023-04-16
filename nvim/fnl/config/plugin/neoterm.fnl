(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim
             util config.util}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")

; Send to REPL (visual mode)
(util.set-key :<leader>E "<Plug>(neoterm-repl-send)" false :v)

