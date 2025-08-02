(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

; Don't wrap lines
(nvim.ex.set :nowrap)

; Global options
(let [options
      {:backup true
       :swapfile false
       :termguicolors true
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
       :undodir (vim.fn.expand "~/.undodir")
       ; Confirmation when closing unsaved file
       :confirm true
       ; Maintain indent when wrapping indented lines
       :breakindent true
       :list true
       ; Share clipboard
       :clipboard "unnamedplus"
       :scrolloff 3
       :number true
       :relativenumber true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; Stop repeating comment character on new line
(nvim.ex.autocmd :FileType :* "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

; Follow terminal output
(nvim.ex.let "neoterm_autoinsert=1")

; Markdown folding
(nvim.ex.let "markdown_folding=1")
(vim.cmd "au FileType markdown setlocal foldlevel=99")

; Open quickfix list at bottom
(nvim.ex.autocmd :FileType :qf "wincmd J")

(vim.cmd "autocmd BufNewFile,BufRead *.phel set syntax=clojure")

; Set colorscheme
(set vim.opt.background "dark")
(vim.cmd "colorscheme tokyonight")
; (vim.cmd "colorscheme catppuccin-latte")

; Don't keep backup in local dir
(vim.opt.backupdir:remove ".")

; Set custom list chars
(set vim.opt.listchars {:tab "▸ " :trail "·"})

;space is reserved to be lead
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

; Conjure state
(vim.api.nvim_create_augroup "conjure-set-state-key-on-filetype" {:clear true})

(vim.api.nvim_create_autocmd ["BufReadPost" "BufNewFile" "BufEnter"]
  {:group "conjure-set-state-key-on-filetype"
   :pattern "*.clj,*.cljc"
   :command ":ConjureClientState clj"})

(vim.api.nvim_create_autocmd ["BufReadPost" "BufNewFile" "BufEnter"]
  {:group "conjure-set-state-key-on-filetype"
   :pattern "*.cljs"
   :command ":ConjureClientState cljs"})

{}
