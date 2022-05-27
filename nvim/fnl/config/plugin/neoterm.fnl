(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 8")

; Send to REPL
(nvim.set_keymap :n :<leader>r "<Plug>(neoterm-repl-send-line)" {:noremap false})
(nvim.set_keymap :n :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>el ":TREPLSendFile<CR>" {:noremap false})
(nvim.set_keymap :n :<leader>ec ":Tclear<CR>" {:noremap false})

; Copy repl output to current buffer
; Horizontal split
(nvim.set_keymap :n :<leader>ea "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
; Vertical split
(nvim.set_keymap :n :<leader>eo "<C-W>lGkyy<C-W>hpgcc" {:noremap false})

; Open split terminal windows at bottom
(nvim.set_keymap :n :<leader>en ":botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})

; Resize terminal windows
(nvim.set_keymap :n :<leader>er ":resize 10<CR><C-W>k" {:noremap false})
