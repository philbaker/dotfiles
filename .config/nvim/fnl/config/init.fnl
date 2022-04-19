(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

; Leader mapping
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; General mapping
; Disable highlight
(nvim.set_keymap :n :<leader>r ":noh<CR><CR>" {:noremap true})
; Save file
(nvim.set_keymap :n :s ":w<CR>" {:noremap true})
; Escape for terminal mode
(nvim.set_keymap :t :<Esc> "<C-\\><C-n>" {:noremap true})

; Don't wrap lines
(nvim.ex.set :nowrap)

; Global options
(let [options
      {:backup false
       :swapfile false
       :colorcolumn "80"
       :foldenable false
       ; Open new horizontal panes on down pane
       :splitbelow true
       ; Open new vertical panes on right pane
       :splitright true
       ; Add dollar to cw command
       :cpoptions "ces$"
       ; Auto completion
       :completeopt "menuone,noselect"
       ; Feedback when using substitute
       :inccommand "nosplit"
       ; Case insensitive search
       :ignorecase true
       ; Smart search case
       :smartcase true
       ; Line numbers
       :number true
       ; Persistent undo
       :undofile true
       :undodir ".config/nvim/undo"
       ; Share clipboard
       :clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; Import plugin.fnl
(require :config.plugin)
