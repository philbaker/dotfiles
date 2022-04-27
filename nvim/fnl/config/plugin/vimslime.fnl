(module config.plugin.vimslime
  {autoload {nvim aniseed.nvim}})

(set nvim.g.slime_target "neovim")
(nvim.set_keymap :x :<leader>r "<Plug>SlimeRegionSend" {:noremap false})
(nvim.set_keymap :n :<leader>r "<Plug>SlimeParagraphSend" {:noremap false})
(nvim.set_keymap :n :<c-c>v "<Plug>SlimeConfig" {:noremap false})

; Copy REPL output and paste in current buffer
(nvim.set_keymap :n :<leader>o "<C-W>jGkyy<C-W>kpgcc" {:noremap false})
(nvim.set_keymap :n :<leader>e "<C-W>lGkyy<C-W>hpgcc" {:noremap false})
