(module config.plugin.nvimcomment
  {autoload {nvim aniseed.nvim
             nvim_comment nvim_comment}})

(nvim_comment.setup
  ; {:hook (fn []
  ;          ((. (require :ts_context_commentstring.internal)
  ;              :update_commentstring)))}
  )
