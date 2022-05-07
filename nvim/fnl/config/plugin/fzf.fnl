(module config.plugin.fzf
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>. ":Buffers<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>t ":Files<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>c ":GFiles<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>a "<Plug>AgRawSearch" {:noremap true})
(nvim.set_keymap :n :<leader>b ":Marks<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>h ":Help<CR>" {:noremap true})
(nvim.ex.let "$FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all'")
