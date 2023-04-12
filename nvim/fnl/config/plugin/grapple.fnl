(module config.plugin.conjure
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.set-key :<leader>hh ":GrapplePopup tags<CR>" false)
(util.set-key :<leader>ht ":GrappleTag<CR>" false)
(util.set-key :<leader>hn ":GrappleCycle forward<CR>" false)
(util.set-key :<leader>hp ":GrappleCycle backward<CR>" false)
(util.set-key :<leader>ha ":GrappleSelect key=1<CR>" false)
(util.set-key :<leader>hb ":GrappleSelect key=2<CR>" false)
(util.set-key :<leader>hc ":GrappleSelect key=3<CR>" false)
(util.set-key :<leader>hd ":GrappleSelect key=4<CR>" false)
