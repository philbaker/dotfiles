[{1 :JoosepAlviste/nvim-ts-context-commentstring
  :opts {
         :custom_calculation (fn [node language_tree]
                               (when (and (= vim.bo.filetype :blade)
                                          (not= language_tree._lang
                                                :javascript))
                                 "{{-- %s --}}"))}}]
