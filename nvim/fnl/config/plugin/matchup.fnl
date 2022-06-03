(module config.plugin.matchup
  {autoload {nvim aniseed.nvim}})

(nvim.ex.let "g:matchup_matchparen_offscreen = {'method': 'popup'}")
