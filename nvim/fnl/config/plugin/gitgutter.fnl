(module config.plugin.gitgutter
  {autoload {nvim aniseed.nvim
             util config.util}})

(nvim.ex.let "g:gitgutter_map_keys = 0")

(util.set-key :<leader>ghs "<Plug>(GitGutterStageHunk)" true :x)
