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
(nvim.set_keymap :n :<leader>dc ":e ~/dotfiles/nvim/fnl/config/core.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dm ":e ~/dotfiles/nvim/fnl/config/mapping.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dp ":e ~/dotfiles/nvim/fnl/config/plugin.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dv ":e ~/dotfiles/nvim/fnl/config/plugin/vimslime.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>df ":e ~/dotfiles/nvim/fnl/config/plugin/fzf.fnl<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dl ":e ~/dotfiles/nvim/fnl/config/plugin/lspconfig.fnl<CR>" {:noremap true})

; Open notes
(nvim.set_keymap :n :<leader>dr ":e ~/rotes<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>dn ":e ~/notes<CR>" {:noremap true})

; Window management
(nvim.set_keymap :n :<localleader>ah ":resize 10<CR>" {:noremap true})
(nvim.set_keymap :n :<localleader>ag ":resize 40<CR>" {:noremap true})
(nvim.set_keymap :n :<localleader>as "<C-W>s<C-W>v" {:noremap true})
(nvim.set_keymap :n :<localleader>at ":term<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>c ":q<CR>" {:noremap true})

; Movement
(nvim.set_keymap :n :<C-J> "J" {:noremap true})
(nvim.set_keymap :n :H "<C-W>h" {:noremap true})
(nvim.set_keymap :n :J "<C-W>j" {:noremap true})
(nvim.set_keymap :n :K "<C-W>k" {:noremap true})
(nvim.set_keymap :n :L "<C-W>l" {:noremap true})
(nvim.set_keymap :n :<C-L> "<C-W><C-P>" {:noremap true})
(nvim.set_keymap :n :<C-H> "<C-W><C-J><C-W><C-L>" {:noremap true})
(nvim.set_keymap :n :M "<Plug>(zoom-toggle)" {:noremap true})

; Global file path
(nvim.set_keymap :n :<leader>g ":echo expand('%:p')<CR>" {:noremap true})

; Git
(nvim.set_keymap :n :<leader>gf ":echo expand('%:p')<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gg ":tab G<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ga ":G add .<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gp ":G push<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gc ":G checkout " {:noremap true})
(nvim.set_keymap :n :<leader>gn "!npm run prod" {:noremap true})
(nvim.set_keymap :n :<leader>grm ":G rebase -i main<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gra ":G rebase --abort<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gsa ":G stash<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>gsp ":G stash pop<CR>" {:noremap true})
