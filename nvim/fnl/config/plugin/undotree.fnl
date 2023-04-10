(module config.plugin.undotree
  {autoload {nvim aniseed.nvim
             util config.util}})

(util.set-key :<leader>l ":UndotreeToggle<CR>" false)

(nvim.ex.let "g:undotree_WindowLayout = 3")
