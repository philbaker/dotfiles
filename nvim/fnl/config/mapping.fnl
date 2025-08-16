(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local util (autoload :config.util))

; Mapping

(set vim.o.timeoutlen 500)

; Leader mapping
(util.set-key :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; Escape for terminal mode
(util.set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(util.set-key :<C-R> "<C-R>" false)

; Transform one string into multiple strings (split on space)
(util.set-key :<leader>r ":s-\\%V \\%V-\\\" \\\"-g<CR>" false :v)

{}
