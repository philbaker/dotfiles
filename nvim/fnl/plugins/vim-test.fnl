(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :vim-test/vim-test
  :config (fn []
            (nvim.ex.let "test#strategy = 'slimux'")
            (nvim.ex.let "test#php#phpunit#executable = 'vendor/bin/phpunit'")
            (nvim.ex.let "test#javascript#runner = 'vitest'"))}]
