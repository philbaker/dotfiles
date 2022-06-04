(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")

; Send to REPL
(nvim.set_keymap :n :<leader>r "<Plug>(neoterm-repl-send-line)" {:noremap false})
(nvim.set_keymap :n :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>ef ":TREPLSendFile<CR>" {:noremap false})

; Copy repl output to current buffer
; Horizontal split
(nvim.set_keymap :n :<leader>ea "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>eu "<C-W>jGkV%y<C-W>kpV%gcc<ESC>" {:noremap false})
(nvim.set_keymap :n :<leader>ep "<leader>r:sleep 10m<CR><leader>ea" {:noremap false})
(nvim.set_keymap :n :<leader>ey "<leader>r:sleep 10m<CR><leader>eu" {:noremap false})
; Vertical split
(nvim.set_keymap :n :<leader>eo "<C-W>lGkyy<C-W>hpgcc" {:noremap false})

; Open split terminal windows at bottom
(nvim.set_keymap :n :<leader>en ":Tnew<CR><Esc>mT:botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})

; Resize terminal windows
(nvim.set_keymap :n :<leader>er "<C-W>j:resize 10<CR><C-W>k" {:noremap false})

; Elixir shortcuts
(nvim.set_keymap :n :<leader>ei ":3T iex -S mix<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>emp ":1T mix phx.server<CR>" {:noremap false})

; Stop processes
(nvim.set_keymap :n :<leader>elc ":2Tclear<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>elk ":2Tkill<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>elp ":2T " {:noremap true})
(nvim.set_keymap :n :<leader>ehc ":3Tclear<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ehk ":3Tkill<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ehp ":3T " {:noremap true})
(nvim.set_keymap :n :<leader>ekc ":1Tclear<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ekk ":1Tkill<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ekp ":1T " {:noremap true})

; Npm
(nvim.set_keymap :n :<leader>ejw ":2T npm run watch<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ejp ":2T npm run prod<CR>" {:noremap true})
