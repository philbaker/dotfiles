[{1 "julienvincent/nvim-paredit"
  :config (fn []
            (let [paredit (require "nvim-paredit")]
              (paredit.setup {:keys {"<localleader>i" 
                                     [(fn []
                                        (paredit.cursor.place_cursor
                                          (paredit.wrap.wrap_element_under_cursor "( " ")")
                                          {:placement "inner_start" :mode "insert"}))
                                      "Wrap form insert head"]
                                     "<localleader>I"
                                     [(fn []
                                        (paredit.cursor.place_cursor
                                          (paredit.wrap.wrap_enclosing_form_under_cursor "(" ")")
                                          {:placement "inner_end" :mode "insert"}))
                                      "Wrap form insert tail"]}})))}]
