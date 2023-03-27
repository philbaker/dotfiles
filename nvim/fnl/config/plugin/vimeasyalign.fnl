(module config.plugin.vimeasyalign
  {autoload { nvim aniseed.nvim}})

(nvim.set_keymap :v :<leader>ea "<Plug>(EasyAlign)" {:noremap true})
(nvim.set_keymap :n :<leader>ea "<Plug>(EasyAlign)" {:noremap true})
