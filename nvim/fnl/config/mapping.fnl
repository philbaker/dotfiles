(module config.mapping
  {autoload {util config.util
             core aniseed.core
             nvim aniseed.nvim}})

(set vim.o.timeoutlen 500)

; Leader mapping
(util.set-key :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; Resize windows
(util.set-key :<S-Up> "<C-w>+" true)
(util.set-key :<S-Down> "<C-w>-" true)
(util.set-key :<S-Right> "<C-w>>" true)
(util.set-key :<S-Left> "<C-w><" true)

; Escape for terminal mode
(util.set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(util.set-key :<C-R> "<C-R>" false)
