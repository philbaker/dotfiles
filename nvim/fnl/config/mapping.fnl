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

; Remap repeat.vim redo
(nvim.set_keymap :n :<leader>w "<Plug>(RepeatRedo)" {:noremap true})

; Restore default redo
(nvim.set_keymap :n :<C-R> "<C-R>" {:noremap true})

; Switch buffer
(nvim.set_keymap :n :<leader>u ":b#<CR>" {:noremap true})

; Open nvim config
(nvim.set_keymap :n :<leader>dd ":e ~/dotfiles/nvim/fnl/config/core.fnl<CR>" {:noremap true})

; Open notes
(nvim.set_keymap :n :<leader>da ":e ~/rotes<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>do ":e ~/notes<CR>" {:noremap true})

; Window management
(nvim.set_keymap :n :<localleader>ar ":resize 10<CR>" {:noremap true})
(nvim.set_keymap :n :<localleader>ac ":resize 40<CR>" {:noremap true})
(nvim.set_keymap :n :<localleader>as "<C-W>s<C-W>v" {:noremap true})
(nvim.set_keymap :n :<localleader>at ":term<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>c ":q" {:noremap true})

; Movement
(nvim.set_keymap :n :<C-J> "J" {:noremap true})
(nvim.set_keymap :n :H "<C-W>h" {:noremap true})
(nvim.set_keymap :n :J "<C-W>j" {:noremap true})
(nvim.set_keymap :n :K "<C-W>k" {:noremap true})
(nvim.set_keymap :n :L "<C-W>l" {:noremap true})
(nvim.set_keymap :n :M "<Plug>(zoom-toggle)" {:noremap true})

; Global file path
(nvim.set_keymap :n :<leader>g ":echo expand('%:p')<CR>" {:noremap true})
