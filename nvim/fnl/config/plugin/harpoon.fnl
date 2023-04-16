(module config.plugin.harpoon
  {autoload {nvim aniseed.nvim
             util config.util
             harpoon harpoon}})

(util.set-key :<leader>hf ":lua require('harpoon.mark').add_file()<CR>" true)
(util.set-key :<leader>hh ":lua require('harpoon.ui').toggle_quick_menu()<CR>" true)
(util.set-key :<leader>ha ":lua require('harpoon.ui').nav_file(1)<CR>" true)
(util.set-key :<leader>hb ":lua require('harpoon.ui').nav_file(2)<CR>" true)
(util.set-key :<leader>hc ":lua require('harpoon.ui').nav_file(3)<CR>" true)
(util.set-key :<leader>hd ":lua require('harpoon.ui').nav_file(4)<CR>" true)
(util.set-key :<leader>hp ":lua require('harpoon.ui').nav_prev()<CR>" true)
(util.set-key :<leader>hn ":lua require('harpoon.ui').nav_next()<CR>" true)
