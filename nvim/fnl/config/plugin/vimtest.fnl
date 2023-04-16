(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim
             util config.util}})

(nvim.ex.let "test#strategy = 'neoterm'")
(nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
