(module config.plugin.nerdtree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>nn ":NERDTreeToggle<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>nr ":NERDTreeFind<CR>" {:noremap true})

(set nvim.g.NERDTreeWinPos "right")
(set nvim.g.NERDTreeShowHidden 1)