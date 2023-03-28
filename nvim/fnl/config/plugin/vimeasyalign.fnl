(module config.plugin.vimeasyalign
  {autoload { nvim aniseed.nvim}})

(nvim.set_keymap :x :<leader>ea "<Plug>(EasyAlign)" {:noremap true})
(nvim.set_keymap :n :<leader>ea "<Plug>(EasyAlign)" {:noremap true})
