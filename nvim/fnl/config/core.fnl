(module config.core
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}})

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
       :undodir "/tmp/undodir"
       ; Share clipboard
       :clipboard "unnamedplus"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; Stop repeating comment character on new line
(nvim.ex.autocmd :FileType :* "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")
