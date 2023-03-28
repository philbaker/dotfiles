(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")

; Send to REPL
(nvim.set_keymap :n :<leader>r "<Plug>(neoterm-repl-send-line)" {:noremap false})
(nvim.set_keymap :n :<leader>er "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>E "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :n :<leader>ef ":TREPLSendFile<CR>" {:noremap false})

; Copy repl output to current buffer
; Horizontal split
(nvim.set_keymap :n :<leader>ecc "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>eca "<C-W>jGkV%y<C-W>kpV%gcc<ESC>" {:noremap false})
(nvim.set_keymap :n :<leader>ep "<leader>r:sleep 10m<CR><leader>ea" {:noremap false})
(nvim.set_keymap :n :<leader>ey "<leader>r:sleep 10m<CR><leader>eu" {:noremap false})

; Open split terminal windows at bottom
(nvim.set_keymap :n :<leader>en ":Tnew<CR><Esc>mT<leader>u:botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})
; Open split terminal windows at right
(nvim.set_keymap :n :<leader>et ":Tnew<CR><Esc>mT<leader>:vsplit<CR>:Tnew<CR><Esc>:split<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})

(nvim.set_keymap :n :<leader>ec ":TcloseAll!" {:noremap false})

; Resize terminal windows
(nvim.set_keymap :n :<leader>ei "<C-W>j:resize 10<CR><C-W>k" {:noremap false})
