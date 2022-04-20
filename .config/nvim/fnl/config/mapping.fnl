(module config.mapping
  {autoload { nvim aniseed.nvim}})

; Leader mapping
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; General mapping

; Disable highlight
(nvim.set_keymap :n :<leader><CR> ":noh<CR><CR>" {:noremap true})
; Save file
(nvim.set_keymap :n :s ":w<CR>" {:noremap true})
; Escape for terminal mode
(nvim.set_keymap :t :<Esc> "<C-\\><C-n>" {:noremap true})
; Redo
(nvim.set_keymap :n :<s-U> "<C-R>" {:noremap true})
; Switch buffer
(nvim.set_keymap :n :<leader>u ":b#<CR>" {:noremap true})
