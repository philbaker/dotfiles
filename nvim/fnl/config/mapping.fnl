(module config.mapping
  {autoload { nvim aniseed.nvim}})

; Leader mapping
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; General mapping

; Disable highlight
(nvim.set_keymap :n :<leader><CR> ":noh<CR>" {:noremap true})

; Save file
(nvim.set_keymap :n :<leader>s ":w<CR>" {:noremap true})

; Escape for terminal mode
(nvim.set_keymap :t :<Esc> "<C-\\><C-n>" {:noremap true})

; Restore default redo
(nvim.set_keymap :n :<C-R> "<C-R>" {:noremap true})

; Switch buffer
(nvim.set_keymap :n :<leader>u "<C-^>" {:noremap true})

; Open nvim config
(nvim.set_keymap :n :<leader>dc ":e ~/dotfiles/nvim/fnl/config/core.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dm ":e ~/dotfiles/nvim/fnl/config/mapping.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dp ":e ~/dotfiles/nvim/fnl/config/plugin.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dt ":e ~/dotfiles/nvim/fnl/config/plugin/neoterm.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>df ":e ~/dotfiles/nvim/fnl/config/plugin/fzf.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dv ":e ~/dotfiles/nvim/fnl/config/plugin/vimtest.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dl ":e ~/dotfiles/nvim/fnl/config/plugin/lspconfig.fnl<CR>" {:noremap true})

; Movement
(nvim.set_keymap :n :<leader>h "<C-W>h" {:noremap true})
(nvim.set_keymap :n :<leader>j "<C-W>j" {:noremap true})
(nvim.set_keymap :n :<leader>k "<C-W>k" {:noremap true})
(nvim.set_keymap :n :<leader>l "<C-W>l" {:noremap true})
(nvim.set_keymap :n :<leader>pp "<C-W><C-P>" {:noremap true})
(nvim.set_keymap :n :<leader>pl "<C-W>j<C-W>l" {:noremap true})
(nvim.set_keymap :n :<leader>pmj "<C-W>j<Plug>(zoom-toggle)" {:noremap true})
(nvim.set_keymap :n :<leader>pml "<C-W>j<C-W>l<Plug>(zoom-toggle)" {:noremap true})
(nvim.set_keymap :n :<leader>pmk "<C-W>k<Plug>(zoom-toggle)" {:noremap true})
(nvim.set_keymap :n :<leader>m "<Plug>(zoom-toggle)" {:noremap true})
(nvim.set_keymap :n :<leader>o "<ESC>jcc" {:noremap true})
(nvim.set_keymap :n :<localleader>o "k==o" {:noremap true})
; Resize windows
(nvim.set_keymap :n :<S-Up> "<C-w>+" {:noremap true})
(nvim.set_keymap :n :<S-Down> "<C-w>-" {:noremap true})
(nvim.set_keymap :n :<S-Right> "<C-w>>" {:noremap true})
(nvim.set_keymap :n :<S-Left> "<C-w><" {:noremap true})

; Git
(nvim.set_keymap :n :<leader>gg ":tab G<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ga ":G add .<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gp ":G push<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gc ":G checkout " {:noremap true})

; Toggle line numbers
(nvim.set_keymap :n :<leader>pn ":set invnumber<CR>" {:noremap true})

; Show directories
(nvim.set_keymap :n :<leader>- "<Plug>(dirvish_up)<CR>" {:noremap true})
(nvim.set_keymap :n :- "<Plug>(dirvish_up)<CR>" {:noremap true})
