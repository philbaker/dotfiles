(module config.plugin.vimslime
  {autoload {nvim aniseed.nvim}})

(set nvim.g.slime_target "neovim")
(nvim.set_keymap :x :<leader>i "<Plug>SlimeRegionSend" {:noremap false})
(nvim.set_keymap :n :<leader>i "<Plug>SlimeParagraphSend" {:noremap false})
(nvim.set_keymap :n :<c-c>v "<Plug>SlimeConfig" {:noremap false})
(nvim.set_keymap :n :<localleader>ac ":echo &channel<CR>" {:noremap false})
(nvim.set_keymap :n :<localleader>ad "JG<esc>K" {:noremap false})
(nvim.set_keymap :n :<localleader>ak "LG<esc>K" {:noremap false})

; Send current line
(nvim.set_keymap :n :<leader>r "V$<leader>i" {:noremap false})

; Copy REPL output and paste in current buffer
(nvim.set_keymap :n :<leader>ea "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>eo "<C-W>lGkyy<C-W>hpgcc" {:noremap false})
