(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             util config.util
             telescope telescope
             actions telescope.actions
             layout telescope.actions.layout
             themes telescope.themes}})

(telescope.load_extension "live_grep_args")

(telescope.load_extension "project")

(telescope.load_extension "neoclip")

(telescope.load_extension "harpoon");

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "public/vendor" "public/js/vendor"]
                             :mappings {:i {:<c-l> actions.send_to_qflist
                                            :<c-r> actions.close
                                            :? layout.toggle_preview}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(util.set-key :<leader>te ":lua require('telescope.builtin').find_files()<CR>" true)
(util.set-key :<leader>. ":lua require('telescope.builtin').buffers()<CR>" true)
(util.set-key :<leader>aa ":lua require('telescope.builtin').live_grep()<CR>" true)
(util.set-key :<leader>ar ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" true)
(util.set-key :<leader>th ":lua require('telescope.builtin').help_tags()<CR>" true)
(util.set-key :<leader>ta ":Telescope harpoon marks<CR>" true)
(util.set-key :<leader>tq ":lua require ('telescope.builtin').quickfix()<CR>" true)
(util.set-key :<leader>tm ":lua require ('telescope.builtin').marks()<CR>" true)
(util.set-key :<leader>tl ":lua require ('telescope.builtin').resume()<CR>" true)
(util.set-key :<leader>tj ":lua require ('telescope.builtin').jumplist()<CR>" true)
(util.set-key :<leader>to ":lua require ('telescope.builtin').autocommands()<CR>" true)
(util.set-key :<leader>tc ":Qtc<CR>" true)
(util.set-key :<leader>ty ":Telescope neoclip n<CR>" true)
(util.set-key :<leader>tp ":lua require'telescope'.extensions.project.project{}<CR>" true)
