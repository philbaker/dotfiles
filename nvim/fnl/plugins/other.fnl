[{1 :rgroli/other.nvim
  :main :other-nvim
  :opts {:mappings [:livewire
                    :laravel
                    :react
                    {:context :test
                     :pattern (fn [path]
                                (local m (vim.fn.matchlist
                                           path
                                           "\\v^(.*)/src/(.{-}_test)@!(.{-}).clj(.?)"))
                                (when (> (length m) 0) m))
                     :target "%2/test/%4_test.clj%5"}
                    {:context :implementation
                     :pattern "(.*)/test/(.*)_test.clj(.?)$"
                     :target "%1/src/%2.clj%3"}]}}]
