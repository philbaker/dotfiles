(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local util (autoload :config.util))

[{1 :airblade/vim-gitgutter
  :config (fn []
            (nvim.ex.let "g:gitgutter_map_keys = 0")
            (util.set-key :<leader>ghs "<Plug>(GitGutterStageHunk)" true :x))}]
