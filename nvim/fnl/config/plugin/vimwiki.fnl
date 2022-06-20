(module config.plugin.vimwiki
  {autoload {nvim aniseed.nvim}})

(nvim.ex.let "g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
(nvim.ex.let "g:vimwiki_folding = 'expr'")
