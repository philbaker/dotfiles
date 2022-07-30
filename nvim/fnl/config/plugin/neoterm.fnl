(module config.plugin.neoterm
  {autoload {nvim aniseed.nvim}})

; Defaults
(nvim.ex.let "g:neoterm_autoscroll = 1")
(nvim.ex.let "g:neoterm_size = 10")
; Python fix
; (nvim.ex.let "g:neoterm_bracketed_paste = 1")

; Send to REPL
(nvim.set_keymap :n :<leader>r "<Plug>(neoterm-repl-send-line)" {:noremap false})
(nvim.set_keymap :n :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :v :<leader>i "<Plug>(neoterm-repl-send)" {:noremap false})
(nvim.set_keymap :n :<leader>ef ":TREPLSendFile<CR>" {:noremap false})

; Copy repl output to current buffer
; Horizontal split
(nvim.set_keymap :n :<leader>ea "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>eb "<C-W>lGkyy<C-W>hpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>ed "<C-W>lG$V%y<C-W>hpV%gcc<ESC>" {:noremap false})
(nvim.set_keymap :n :<leader>ee "<localleader>er:sleep 10m<CR><C-W>lG$V%y<C-W>hpV%gcc<ESC>" {:noremap false})
(nvim.set_keymap :n :<leader>eu "<C-W>jGkV%y<C-W>kpV%gcc<ESC>" {:noremap false})
(nvim.set_keymap :n :<leader>ep "<leader>r:sleep 10m<CR><leader>ea" {:noremap false})
(nvim.set_keymap :n :<leader>ey "<leader>r:sleep 10m<CR><leader>eu" {:noremap false})
; Vertical split
(nvim.set_keymap :n :<leader>eo "<C-W>lGkyy<C-W>hpgcc" {:noremap false})

; Open split terminal windows at bottom
(nvim.set_keymap :n :<leader>en ":Tnew<CR><Esc>mT<leader>u:botright Tnew<CR><Esc>:vsplit<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})
; Open split terminal windows at right
(nvim.set_keymap :n :<leader>et ":Tnew<CR><Esc>mT<leader>:vsplit<CR>:Tnew<CR><Esc>:split<CR>:Tnew<CR><Esc><C-W><C-R><C-W>h<C-W>k" {:noremap false})

; Clojure setup
(nvim.set_keymap :n :<leader>ec ":Tnew<CR><Esc>mT:1T clj -A:dev<CR><ESC><leader>u<localleader>lv" {:noremap false})

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
(vim.api.nvim_create_user_command 
  "NPMRunWatch"
  (fn [] (vim.cmd "1T npm run watch"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "NPMRunProd" 
  (fn [] (vim.cmd "2T npm run prod"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "NPMStopCheckoutMain"
  (fn [] (vim.cmd ":2Tkill<CR>:2T git checkout .<CR>:2T git checkout main<CR>"))
  {:bang false})

