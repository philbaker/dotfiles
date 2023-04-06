(module config.plugin.fzf
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.set-key :<leader>. ":Buffers<CR>" true)
(util.set-key :<leader>te ":Files<CR>" true)
(util.set-key :<leader>to ":GFiles<CR>" true)
(util.set-key :<leader>td ":Files ~/dotfiles<CR>" true)
(util.set-key :<leader>tn ":Files ~/neotes<CR>" true)
(util.set-key :<leader>tf ":Files ~/Downloads<CR>" true)
(util.set-key :<leader>aa "<Plug>AgRawSearch" true)
(util.set-key :<leader>av ":Sv " true)
(util.set-key :<leader>an ":Sn " true)
; Search gitignored files
(util.set-key :<leader>au ":AgRaw -u " true)
(util.set-key :<leader>am ":Marks<CR>" true)
(util.set-key :<leader>al ":tab help " true)
(nvim.ex.let "$FZF_DEFAULT_OPTS = '--bind ctrl-s:select-all,ctrl-d:deselect-all'")
