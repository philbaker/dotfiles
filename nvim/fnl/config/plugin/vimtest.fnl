(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim}})

(nvim.ex.let "test#strategy = 'neoterm'")
(nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
