(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<localleader>t ":2T :<CR> :TestNearest<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>T ":2T :<CR> :TestFile<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>s ":2T :<CR> :TestSuite<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>l ":2T :<CR> :TestLast<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>g ":2T :<CR> :TestVisit<CR>" {:noremap false})
(nvim.ex.let "test#strategy = 'neoterm'")
(nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
