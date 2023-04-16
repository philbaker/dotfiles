(module config.plugin.telescope
  {autoload {util config.util
             telescope telescope
             actions telescope.actions
             layout telescope.actions.layout}})

(telescope.load_extension "live_grep_args")

(telescope.load_extension "project")

(telescope.load_extension "neoclip")

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "public/vendor" "public/js/vendor"]
                             :mappings {:i {:<c-l> (+ actions.send_to_qflist actions.open_qflist)
                                            :<c-r> actions.close
                                            :? layout.toggle_preview}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden" "--no-ignore-vcs"]}}})
