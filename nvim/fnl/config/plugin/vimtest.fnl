(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>tt ":2T :<CR> :TestNearest<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>tT ":2T :<CR> :TestFile<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>ts ":2T :<CR> :TestSuite<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>tl ":2T :<CR> :TestLast<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>tg ":2T :<CR> :TestVisit<CR>" {:noremap false})
(nvim.ex.let "test#strategy = 'neoterm'")
(nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
