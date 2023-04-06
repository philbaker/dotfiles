(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.set-key :<leader>tt ":2T :<CR> :TestNearest<CR>" false)
(util.set-key :<leader>tT ":2T :<CR> :TestFile<CR>" false)
(util.set-key :<leader>ts ":2T :<CR> :TestSuite<CR>" false)
(util.set-key :<leader>tl ":2T :<CR> :TestLast<CR>" false)
(util.set-key :<leader>tg ":2T :<CR> :TestVisit<CR>" false)
(nvim.ex.let "test#strategy = 'neoterm'")
(nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
