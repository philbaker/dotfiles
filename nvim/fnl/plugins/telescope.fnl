(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-lua/plenary.nvim
                 :nvim-telescope/telescope-live-grep-args.nvim
                 :nvim-telescope/telescope-project.nvim
                 {1 :isak102/telescope-git-file-history.nvim
                  :dependencies [:tpope/vim-fugitive]}]
  :config (fn []
            (let [telescope (require :telescope)
                  actions (require :telescope.actions)
                  layout (require :telescope.actions.layout)
                  lga-actions (require :telescope-live-grep-args.actions)]
              (telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "public/vendor" "public/build"]
                                           :mappings {:i {:<c-l> (+ actions.send_to_qflist actions.open_qflist)
                                                          :<c-r> actions.close
                                                          :<c-n> actions.cycle_history_next
                                                          :<c-p> actions.cycle_history_prev
                                                          :? layout.toggle_preview}}}}
                               :pickers {:find_files {:find_command ["rg"
                                                                     "--color=never"
                                                                     "--no-heading"
                                                                     "--with-filename"
                                                                     "--line-number"
                                                                     "--column"
                                                                     "--smart-case"
                                                                     "--iglob"
                                                                     "!.git"
                                                                     "--hidden"]}})
              (telescope.load_extension "live_grep_args")
              (telescope.load_extension "project")
              (telescope.load_extension "git_file_history")))}]
