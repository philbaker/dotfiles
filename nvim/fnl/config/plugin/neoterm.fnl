(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")

; Send to REPL
(nvim.set_keymap :n :<leader>r "<Plug>(neoterm-repl-send-line)" {:noremap false})
(nvim.set_keymap :n :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>sf ":TREPLSendFile<CR>" {:noremap false})

; Copy repl output to current buffer
; Horizontal split
(nvim.set_keymap :n :<leader>sa "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
; Vertical split
(nvim.set_keymap :n :<leader>so "<C-W>lGkyy<C-W>hpgcc" {:noremap false})

; Open split terminal windows at bottom
(nvim.set_keymap :n :<leader>sq ":botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})

; Resize terminal windows
(nvim.set_keymap :n :<leader>sr ":resize 10<CR><C-W>k" {:noremap false})

; Start iex
(nvim.set_keymap :n :<leader>se ":2T iex -S mix<CR>" {:noremap false})

; Stop processes
(nvim.set_keymap :n :<leader>su ":2Tclear<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>si ":1Tclear<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>sj ":2Tkill<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>sk ":1Tkill<CR>" {:noremap true})

; Npm
(nvim.set_keymap :n :<leader>sw ":1T npm run watch<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>sp ":1T npm run prod<CR>" {:noremap true})
