(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim
             util config.util}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")

; Send to REPL
(util.set-key :<leader>r "<Plug>(neoterm-repl-send-line)" false)
(util.set-key :<leader>er "<Plug>(neoterm-repl-send)" false)
(util.set-key :<leader>E "<Plug>(neoterm-repl-send)" false :v)
(util.set-key :<leader>ef ":TREPLSendFile<CR>" false)

; Copy repl output to current buffer
; Horizontal split
(util.set-key :<leader>ecc "<C-W>jGkyy<C-W>kpgcc" false)
(util.set-key :<leader>eca "<C-W>jGkV%y<C-W>kpV%gcc<ESC>" false)
(util.set-key :<leader>ep "<leader>r:sleep 10m<CR><leader>ea" false)
(util.set-key :<leader>ey "<leader>r:sleep 10m<CR><leader>eu" false)

; Sets up default terminals without splits
(util.set-key :<leader>eg ":Nter<CR>" false)

; Open split terminal windows at bottom
(util.set-key :<leader>en ":Tnew<CR><Esc>mT<leader>u:botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" false)
; Open split terminal windows at right
(util.set-key :<leader>et ":Tnew<CR><Esc>mT<leader>:vsplit<CR>:Tnew<CR><Esc>:split<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" false)

(util.set-key :<leader>ec ":TcloseAll!" false)

; Resize terminal windows
(util.set-key :<leader>ei "<C-W>j:resize 10<CR><C-W>k" false)
