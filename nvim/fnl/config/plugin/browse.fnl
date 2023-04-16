(module config.plugin.browse
  {autoload {browse browse
             util config.util}})

(browse.setup {:bookmarks 
               {:github {:name "search github from neovim"
                         :code_search "https://github.com/search?q=%s&type=code"
                         :issues_search "https://github.com/search?q=%s&type=issues"
                         :pulls_search "https://github.com/search?q=%s&type=pullrequests"
                         :repo_search "https://github.com/search?q=%s&type=repositories"}}})
