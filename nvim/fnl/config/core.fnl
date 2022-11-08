(module config.core
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}
   require-macros [config.macro]})

; Don't wrap lines
(nvim.ex.set :nowrap)

; Global options
(let [options
      {:backup false
       :swapfile false
       :colorcolumn "80"
       ; Open new horizontal panes on down pane
       :splitbelow true
       ; Open new vertical panes on right pane
       :splitright true
       ; Auto completion
       :completeopt "menuone,noselect"
       ; Feedback when using substitute
       :inccommand "nosplit"
       ; Case insensitive search
       :ignorecase true
       ; Smart search case
       :smartcase true
       ; Keep lsp column open to prevent text jumping
       :signcolumn "yes"
       ; Persistent undo
       :undofile true
       :undodir "/tmp/undodir"
       ; Share clipboard
       :clipboard "unnamedplus"
       :scrolloff 3
       :number true
       :relativenumber true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; Stop repeating comment character on new line
(nvim.ex.autocmd :FileType :* "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

; Use correct comment syntax
(augroup comment-type
         (nvim.ex.autocmd
           :FileType "elixir"
           "setlocal commentstring=#\\ %s")
         (nvim.ex.autocmd
           :FileType "heex"
           "setlocal commentstring=<%#%s%>")
         (nvim.ex.autocmd
           :FileType "svelte"
           "setlocal commentstring=<!--%s-->"))

; Follow terminal output
(nvim.ex.let "neoterm_autoinsert=1")

; Open quickfix list at bottom
(nvim.ex.autocmd :FileType :qf "wincmd J")
