(module config.plugin.nerdtree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>tt ":NERDTreeToggle<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>tr ":NERDTreeFind<CR>" {:noremap true})

(set nvim.g.NERDTreeWinPos "right")
(set nvim.g.NERDTreeShowHidden 1)
