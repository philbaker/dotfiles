(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             util config.util
             telescope telescope
             actions telescope.actions
             themes telescope.themes}})

(telescope.load_extension "live_grep_args")

(telescope.load_extension "neoclip")

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules" "public/vendor" "public/js/vendor"]
                             :mappings {:i {:<c-l> (+ actions.send_to_qflist)}}}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(util.set-key :<leader>ta ":lua require('telescope.builtin').find_files()<CR>" true)
(util.set-key :<leader>tg ":lua require('telescope.builtin').live_grep()<CR>" true)
(util.set-key :<leader>tb ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" true)
(util.set-key :<leader>t. ":lua require('telescope.builtin').buffers()<CR>" true)
(util.set-key :<leader>th ":lua require('telescope.builtin').help_tags()<CR>" true)
(util.set-key :<leader>tq ":lua require ('telescope.builtin').quickfix()<CR>" true)
(util.set-key :<leader>tm ":lua require ('telescope.builtin').marks()<CR>" true)
(util.set-key :<leader>tc ":Qtc<CR>" true)
(util.set-key :<leader>ty ":Telescope neoclip n<CR>" true)