(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             util config.util
             which-key which-key}})


(which-key.setup {:triggers_blacklist {:n ["'" "\"" "v"]}})

(which-key.register 
  {:. [":lua require('telescope.builtin').buffers()<CR>" "Buffer list"]
   :- [":Dirbuf<CR>" "Dirbuf"]
   :<CR> [":noh<CR>" "Clear highlights"]
   :a {:name "Fuzzy grep"
       :a [":lua require('telescope.builtin').live_grep()<CR>" "Grep"]
       :d [":lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>" "Dotfiles grep"]
       :n [":lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('~/neotes')}})<CR>" "Neotes grep"]
       :r [":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" "Grep with args"]}
   :c {:name "Quickfix list"
       :o [":cope<CR>" "Open Quickfix list"]
       :c [":ccl<CR>" "Close Quickfix list"]
       :n [":cn<CR>" "Next Quickfix item"]
       :p [":cp<CR>" "Previous Quickfix item"]
       :l {:name "Location list"
           :o [":lopen<CR>" "Open location list"]
           :c [":lcl<CR>" "Close location list"]
           :n [":lnext<CR>" "Next location list item"]
           :p [":lprev<CR>" "Previous location list item"]}}
   :d {:name "Test"
       :n [":2T :<CR> :TestNearest<CR>" "Nearest"]
       :f [":2T :<CR> :TestFile<CR>" "File"]
       :s [":2T :<CR> :TestSuite<CR>" "Suite"]
       :p [":2T :<CR> :TestLast<CR>" "Previous"]
       :a [":TestVisit<CR>" "Last run test code"]}
   :f "Undo tree"
   :g {:name "Git"
       :g [":tab Git<CR>" "Git status"]
       :l [":tab Git log<CR>" "Git log"]
       :a [":Git add .<CR>" "Git add ."]
       :p [":Git push<CR>" "Git push"]
       :c [":Git checkout " "Git checkout"]}
   :gh {:name "GitGutter"
        :p ["<Plug>(GitGutterPreviewHunk)" "Preview hunk"]
        :u ["<Plug>(GitGutterUndoHunk)"  "Undo hunk"]
        :s ["<Plug>(GitGutterStageHunk)"  "Stage hunk"]}
   :h {:name "Harpoon"
       :f [":lua require('harpoon.mark').add_file()<CR>" "Add file"]
       :h [":lua require('harpoon.ui').toggle_quick_menu()<CR>" "Show menu"]
       :a [":lua require('harpoon.ui').nav_file(1)<CR>" "Nav file 1"]
       :b [":lua require('harpoon.ui').nav_file(2)<CR>" "Nav file 2"]
       :c [":lua require('harpoon.ui').nav_file(3)<CR>" "Nav file 3"]
       :d [":lua require('harpoon.ui').nav_file(4)<CR>" "Nav file 4"]
       :p [":lua require('harpoon.ui').nav_prev()<CR>" "Nav prev"]
       :n [":lua require('harpoon.ui').nav_next()<CR>" "Nav next"]}
   :l {:name "LSP"
       :a "Fuzzy diagnostics"
       :b "Fuzzy references"
       :c "Fuzzy implementations"
       :d "Declaration"
       :t "Type definition"
       :h "Signature help"
       :r "Rename"
       :e "Open float"
       :q "Set loclist"
       :f "Format"
       :n "Next diagnostic"
       :p "Previous diagnostic"
       :s "Document symbols"}
   :m {:name "Meta"
       :ps [":SaveIndexAndReturn<CR>" "Vite save / reload"]
       :n [":set invnumber<CR>" "Toggle current line number"]
       :c [":ClerkShow<CR>" "Show Clerk notebook"]
       :jc [":Jac<CR>" "Compile Java"]
       :jr [":Jar<CR>" "Run Java"]
       :je [":JSRemoveExportSave<CR>" "JS remove export"]
       :jeb ["$V%:s/export //g<CR>" "JS remove in block"]
       :jv [":JSRemoveExportSave<CR>" "JS replace const with var"]
       :jt [":JSRemoveLet<CR>" "JS remove let"]
       :pj ["f;xIexpect(<ESC>A).toBe(<ESC>JxA);<ESC>" "Test from rich comment"]
       :pk ["/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^" "Turn test back into comment"]}
   :n {:name "Terminal"
       :n [":Nter<CR>" "Open default terminals"]
       :t [":Rsp<CR>" "Terminal split for RDD"]
       :r ["<Plug>(neoterm-repl-send-line)" "Send line to REPL"]
       :f ["<Plug>(neoterm-repl-send)" "Send form to REPL"]
       :b [":TREPLSendFile<CR>" "Send file to REPL"]
       :cc [":Rspa<CR>" "Put REPL line output to current bufer"]
       :ca [":Rspa block<CR>" "Put REPL block output to current bufer"]
       :i [":<C-W>j:resize 10<CR><C-W>k" "Resize terminal windows"]}
   :p {:name "Formatting"
       :r [":Prettier<CR>" "Prettier"]
       :i [":Pint<CR>" "Pint"]} 
   :r "Send to REPL"
   :s [":w<CR>" "Save"]
   :t {:name "Fuzzy file"
       :. [":lua require ('telescope.builtin').resume()<CR>" "Last search"]
       :b [":lua require('browse').browse({ bookmarks = bookmarks })<CR>" "Documentation"]
       :d [":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>" "Dotfiles"]
       :e [":lua require('telescope.builtin').find_files()<CR>" "Files"]
       :h [":lua require('telescope.builtin').help_tags()<CR>" "Help"]
       :j [":lua require ('telescope.builtin').quickfix()<CR>" "Jumplist"]
       :n [":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/neotes')}})<CR>" "Neotes"]
       :m [":lua require ('telescope.builtin').marks()<CR>" "Marks"]
       :o [":lua require ('telescope.builtin').autocommands()<CR>" "Autocommands"]
       :p [":lua require'telescope'.extensions.project.project{}<CR>" "Projects"]
       :q [":lua require ('telescope.builtin').quickfix()<CR>" "Quickfix list"]
       :y [":Telescope neoclip n<CR>" "Neoclip"]}
   :tt {:name "Test"}
   :u ["<C-^>" "Switch buffer"]
   :z {:name "Telekasten"
       :f ["<cmd>Telekasten find_notes<CR>" "Find notes"]
       :g ["<cmd>Telekasten search_notes<CR>" "Search notes"]
       :d ["<cmd>Telekasten goto_today<CR>" "Go to today"]
       :z ["<cmd>Telekasten follow_link<CR>" "Follow link"]
       :n ["<cmd>Telekasten new_note<CR>" "New note"]
       :c ["<cmd>Telekasten show_calendar<CR>" "Show calendar"]
       :b ["<cmd>Telekasten show_backlinks<CR>" "Show backlinks"]
       :I ["<cmd>Telekasten insert_img_link<CR>" "Insert image link"]}}
   {:prefix "<leader>"})
