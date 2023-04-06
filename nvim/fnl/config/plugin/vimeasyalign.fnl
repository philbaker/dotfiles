(module config.plugin.vimeasyalign
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.set-key :<leader>ea "<Plug>(EasyAlign)" true :x)
(util.set-key :<leader>ea "<Plug>(EasyAlign)" true)
