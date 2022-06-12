(module config.plugin.nerdtree
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>n ":NERDTreeToggle<CR>" {:noremap true})

(set nvim.g.NERDTreeWinPos "right")
(set nvim.g.NERDTreeShowHidden 1)
(set nvim.g.NERDTreeHijackNetrw 0)
