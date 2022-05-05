(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             telescope telescope
             actions telescope.actions}})

(telescope.load_extension "live_grep_raw")

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]
                             :mappings {:i {:<c-l> (+ actions.send_to_qflist actions.open_qflist)}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(nvim.set_keymap :n :<leader>t ":lua require('telescope.builtin').find_files()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>a ":lua require('telescope.builtin').live_grep()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>b ":lua require('telescope').extensions.live_grep_raw.live_grep_raw()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>. ":lua require('telescope.builtin').buffers()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>h ":lua require('telescope.builtin').help_tags()<CR>" {:noremap true})
