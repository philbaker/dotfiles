(module config.plugin.vimwiki
  {autoload {nvim aniseed.nvim}})

(nvim.ex.let "g:vimwiki_list = [{'path': '~/my_site/', 'syntax': 'markdown', 'ext': '.md'}]")
