(module config.plugin.telescope
  {autoload {telescope telescope
             actions telescope.actions
             layout telescope.actions.layout
             lga-actions telescope-live-grep-args.actions}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "public/vendor" "public/js/vendor"]
                             :mappings {:i {:<c-l> (+ actions.send_to_qflist actions.open_qflist)
                                            :<c-r> actions.close
                                            :<c-n> actions.cycle_history_next
                                            :<c-p> actions.cycle_history_prev
                                            :? layout.toggle_preview}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden" "--no-ignore-vcs"]}}
                  :extensions {:live_grep_args {:auto_quoting true
                                                :mappings {:i {:<c-i> (lga-actions.quote_prompt {:postfix " --iglob "})
                                                               :<c-k> (lga-actions.quote_prompt)}}}}})

(telescope.load_extension "live_grep_args")

(telescope.load_extension "project")

(telescope.load_extension "neoclip")
