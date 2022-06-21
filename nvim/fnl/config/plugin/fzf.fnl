(module config.plugin.fzf
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>. ":Buffers<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>te ":Files<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>a "<Plug>AgRawSearch" {:noremap true})
(nvim.set_keymap :n :<leader>fg ":GFiles<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fm ":Marks<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>fh ":tab help " {:noremap true})
(nvim.set_keymap :n :<leader>ff ":Files ~/wiki/vimwiki<CR>" {:noremap true})
(nvim.ex.let "$FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all,ctrl-d:deselect-all'")
