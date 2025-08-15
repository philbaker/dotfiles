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

; Split navigation
(vim.keymap.set :n :<c-h> (. (require :smart-splits) :move_cursor_left))
(vim.keymap.set :n "<leader>wh" (. (require :smart-splits) :move_cursor_left))
(vim.keymap.set :n :<c-j> (. (require :smart-splits) :move_cursor_down))
(vim.keymap.set :n "<leader>wj" (. (require :smart-splits) :move_cursor_down))
(vim.keymap.set :n :<c-k> (. (require :smart-splits) :move_cursor_up))
(vim.keymap.set :n "<leader>wk" (. (require :smart-splits) :move_cursor_up))
(vim.keymap.set :n :<c-l> (. (require :smart-splits) :move_cursor_right))
(vim.keymap.set :n "<leader>wl" (. (require :smart-splits) :move_cursor_right))
(vim.keymap.set :n "<c-g>" (. (require :smart-splits) :move_cursor_previous))
(vim.keymap.set :n "<leader>wg" (. (require :smart-splits) :move_cursor_previous))

(vim.keymap.set :n :<leader>H (. (require :smart-splits) :resize_left))
(vim.keymap.set :n :<leader>J (. (require :smart-splits) :resize_down))
(vim.keymap.set :n :<leader>K (. (require :smart-splits) :resize_up))
(vim.keymap.set :n :<leader>L (. (require :smart-splits) :resize_right))

(vim.keymap.set :n :<leader>wH (. (require :smart-splits) :swap_buf_left))
(vim.keymap.set :n :<leader>wJ (. (require :smart-splits) :swap_buf_down))
(vim.keymap.set :n :<leader>wK (. (require :smart-splits) :swap_buf_up))
(vim.keymap.set :n :<leader>wL (. (require :smart-splits) :swap_buf_right))

{}
