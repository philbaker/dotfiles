(module config.plugin.vimtest
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<localleader>t ":TestNearest<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>T ":TestFile<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>s ":TestSuite<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>l ":TestLast<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>g ":TestVisit<CR>" {:noremap false})
