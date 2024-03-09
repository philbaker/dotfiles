(local {: autoload} (require :nfnl.module))
(local wk (require "which-key"))

(wk.register
  {:. [":lua require('telescope.builtin').buffers()<CR>" "Buffer list"]
   :- [":Dirbuf<CR>" "Dirbuf"]
   :<CR> [":noh<CR>" "Clear highlights"]
   :a {:name "Fuzzy grep"
       :a [":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" "Grep with args"]
       :d [":lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>" "Dotfiles grep"]
       :n [":lua require('telescope.builtin').live_grep({search_dirs={vim.fn.expand('~/neotes')}})<CR>" "Neotes grep"]}
   :c {:name "Conjure"}
   :d {:name "Test"
       :n [":2T :<CR> :TestNearest<CR>" "Nearest"]
       :f [":2T :<CR> :TestFile<CR>" "File"]
       :s [":2T :<CR> :TestSuite<CR>" "Suite"]
       :p [":2T :<CR> :TestLast<CR>" "Previous"]
       :a [":TestVisit<CR>" "Last run test code"]}
   :g {:name "Git"
       :g [":tab Git<CR>" "Git status"]
       :l [":tab Git log<CR>" "Git log"]
       :a [":Git add .<CR>" "Git add ."]
       :p [":Git push<CR>" "Git push"]
       :c [":Git checkout " "Git checkout"]}
   :h {:name "Harpoon"
       :f [":lua require('harpoon.mark').add_file()<CR>" "Add file"]
       :h [":lua require('harpoon.ui').toggle_quick_menu()<CR>" "Show menu"]
       :a [":lua require('harpoon.ui').nav_file(1)<CR>" "Nav file 1"]
       :b [":lua require('harpoon.ui').nav_file(2)<CR>" "Nav file 2"]
       :c [":lua require('harpoon.ui').nav_file(3)<CR>" "Nav file 3"]
       :d [":lua require('harpoon.ui').nav_file(4)<CR>" "Nav file 4"]
       :e [":lua require('harpoon.ui').nav_file(5)<CR>" "Nav file 5"]
       :p [":lua require('harpoon.ui').nav_prev()<CR>" "Nav prev"]
       :n [":lua require('harpoon.ui').nav_next()<CR>" "Nav next"]}
   :j ["<C-W>j" "Window down"]
   :k ["<C-W>k" "Window up"]
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
   :m {:name "Misc"
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
       :pk ["/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^" "Turn test back into comment"]
       :ea [":EncryptNotes all<CR>" "Encrypt all"]
       :da [":DecryptNotes all<CR>" "Decrypt all"]
       :eh [":EncryptNotes home<CR>" "Encrypt home"]
       :dh [":DecryptNotes home<CR>" "Decrypt home"]
       :u {:name "Utils"
           :r [":PixelToRem<CR>" "Pixel to Rem"]
           :p [":RemToPixel<CR>" "Rem to Pixel"]
           :g [":HexToRgb<CR>" "Hex to RGB"]
           :h [":RgbToHex<CR>" "RGB to Hex"]
           :th [":TailwindClassToHex<CR>" "Tailwind class to hex"]
           :tc [":TailwindHexToClass<CR>" "Tailwind hex to class"]}
       :y {:name "Neoclip"
           :y [":Telescope neoclip plus<CR>" "Put selected yank into plus register"]}}
   :n {:name "Terminal"
       :n [":Nter<CR>" "Open default terminals"]
       :t [":Rsp<CR>" "Terminal split for RDD"]
       :r ["<Plug>(neoterm-repl-send-line)" "Send line to REPL"]
       :f ["<Plug>(neoterm-repl-send)" "Send form to REPL"]
       :b [":TREPLSendFile<CR>" "Send file to REPL"]
       :c {:name "REPL"}
       :cc [":Rspa<CR>" "Put REPL line output to current bufer"]
       :ca [":Rspa block<CR>" "Put REPL block output to current bufer"]
       :i [":Resize10<CR>" "Make bottom split size 10"]
       :p {:name "Process"}
       :ps {:name "Shadow"}
       :psw [":1T npm run shadow:watch<CR>" "npm run shadow:watch"]
       :psr [":1T npm run shadow:release<CR>" "npm run shadow:release"]
       :pt {:name "Tailwind"}
       :ptw [":2T npm run tailwind:watch<CR>" "npm run tailwind:watch"]
       :ptr [":2T npm run tailwind:release<CR>" "npm run tailwind:release"]
       :pw [":1T npm run watch<CR>" "npm run watch"]
       :pr [":1T npm run prod<CR>" "npm run prod"]
       :pc [":1T clj -A:dev<CR>" "clj -A:dev"]
       :pbb [":BbRepl 1667<CR>" "BB nrepl server"]
       :pbn [":NbbRepl 1337" "NBB nrepl server"]}
   :p {:name "Formatting"
       :r [":Prettier<CR>" "Prettier"]
       :i [":Pint<CR>" "Pint"]}
   :q {:name "Quickfix list"
       :o [":cope<CR>" "Open Quickfix list"]
       :c [":ccl<CR>" "Close Quickfix list"]
       :n [":cn<CR>" "Next Quickfix item"]
       :p [":cp<CR>" "Previous Quickfix item"]
       :l {:name "Location list"
           :o [":lopen<CR>" "Open location list"]
           :c [":lcl<CR>" "Close location list"]
           :n [":lnext<CR>" "Next location list item"]
           :p [":lprev<CR>" "Previous location list item"]}}
   :s [":w<CR>" "Save"]
   :t {:name "Fuzzy file"
       :. [":lua require ('telescope.builtin').resume()<CR>" "Last search"]
       :c [":lua require('telescope.builtin').commands()<CR>" "Commands"]
       :d [":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>" "Dotfiles"]
       :e [":lua require('telescope.builtin').find_files()<CR>" "Files"]
       :f [":lua require('telescope.builtin').oldfiles()<CR>" "History"]
       :h [":lua require('telescope.builtin').help_tags()<CR>" "Help"]
       :j [":lua require ('telescope.builtin').quickfix()<CR>" "Jumplist"]
       :n [":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/neotes')}})<CR>" "Neotes"]
       :m [":lua require ('telescope.builtin').marks()<CR>" "Marks"]
       :o [":lua require ('telescope.builtin').autocommands()<CR>" "Autocommands"]
       :p [":lua require'telescope'.extensions.project.project{}<CR>" "Projects"]
       :q [":lua require ('telescope.builtin').quickfix()<CR>" "Quickfix list"]
       :y [":Telescope neoclip n<CR>" "Neoclip"]}
   :u ["<C-^>" "Switch buffer"]
   :z {:name "Notes"
       :a [":VimSexpKeyBindings<CR>" "Vim Sexp bindings"]
       :e [":VimSexpKeyMappings<CR>" "Vim Sexp mappings"]
       :i [":VimSurroundKeyMappings<CR>" "Vim Surround mappings"]}}
   {:prefix "<leader>"})

[{1 :folke/which-key.nvim
    :opts {:triggers_blacklist {:n ["'" "\"" "v"]}}}]
