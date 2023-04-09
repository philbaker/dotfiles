(module config.plugin.cmp
  {autoload {nvim aniseed.nvim
             util config.util
             harpoon harpoon}})

(util.set-key :<leader>ha ":lua require('harpoon.mark').add_file()<CR>" true)
(util.set-key :<leader>hh ":lua require('harpoon.ui').toggle_quick_menu()<CR>" true)
(util.set-key :<leader>hn ":lua require('harpoon.ui').nav_file(" true)
(util.set-key :<leader>ho ":lua require('harpoon.ui').nav_prev()<CR>" true)
(util.set-key :<leader>hu ":lua require('harpoon.ui').nav_next()<CR>" true)
