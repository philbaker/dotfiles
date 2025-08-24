(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :ojroques/vim-oscyank
  :config (fn []
            (nvim.ex.let "g:oscyank_max_length = 0")  ; maximum length of a selection, 0 for unlimited length
            (nvim.ex.let "g:oscyank_silent = 0")  ; disable message on successful copy
            (nvim.ex.let "g:oscyank_trim = 0")  ; trim surrounding whitespaces before copy
            (nvim.ex.let "g:oscyank_osc52 = \"\x1b]52;c;%s\x07\"")  ; the OSC52 format string to use

            (vim.keymap.set :n :<leader>y :<Plug>OSCYankOperator)
            ; (vim.keymap.set :n :<leader>yc :<leader>c_ {:remap true})
            (vim.keymap.set :v :<leader>y :<Plug>OSCYankVisual))}]
