(module config.plugin.fzf
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>. ":Buffers<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>te ":Files<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ah ":Files<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>aa "<Plug>AgRawSearch" {:noremap true})
; Search gitignored files
(nvim.set_keymap :n :<leader>au ":AgRaw -u " {:noremap true})
(nvim.set_keymap :n :<leader>ag ":GFiles<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>am ":Marks<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>al ":tab help " {:noremap true})
(nvim.ex.let "$FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all,ctrl-d:deselect-all'")
