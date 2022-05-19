(module config.mapping
  {autoload { nvim aniseed.nvim}})

; Leader mapping
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.maplocalleader ",")

; General mapping

; Disable highlight
(nvim.set_keymap :n :<leader><CR> ":noh<CR><CR>" {:noremap true})
; Save file
(nvim.set_keymap :n :s ":w<CR>" {:noremap true})
; Escape for terminal mode
(nvim.set_keymap :t :<Esc> "<C-\\><C-n>" {:noremap true})
; Remap repeat.vim redo
(nvim.set_keymap :n :<leader>w "<Plug>(RepeatRedo)" {:noremap true})
; Restore default redo
(nvim.set_keymap :n :<C-R> "<C-R>" {:noremap true})
; Switch buffer
(nvim.set_keymap :n :<leader>u ":b#<CR>" {:noremap true})
; Open nvim config
(nvim.set_keymap :n :<leader>dd ":e ~/dotfiles/nvim/fnl/config/core.fnl<CR>" {:noremap true})
; Open notes
(nvim.set_keymap :n :<leader>dr ":e ~/rotes<CR>" {:noremap true})
; Set default split height
(nvim.set_keymap :n :<localleader>a ":resize 14<CR>" {:noremap true})
(nvim.set_keymap :n :<localleader>c ":resize 35<CR>" {:noremap true})
; Global file path
(nvim.set_keymap :n :<leader>g ":echo expand('%:p')<CR>" {:noremap true})
