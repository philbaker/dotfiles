(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             util config.util
             which-key which-key}})


(which-key.setup {:triggers_blacklist {:n ["'" "\"" "v"]}})

(which-key.register 
  {:. "Buffer list"
   :- [":Dirbuf<CR>" "Dirbuf"]
   :<CR> [":noh<CR>" "Clear highlights"]
   :a {:name "Fuzzy grep"
       :a "Grep"
       :d "Dotfiles grep"
       :n "Neotes grep"
       :r "Grep with args"}
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
   :f "Undo tree"
   :g {:name "Git"
       :g [":tab Git<CR>" "Git status"]
       :l [":tab Git log<CR>" "Git log"]
       :a [":Git add .<CR>" "Git add ."]
       :p [":Git push<CR>" "Git push"]
       :c [":Git checkout " "Git checkout"]}
   :gh {:name "GitGutter"}
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
   :n {:name "Terminal"
       :n [":Nter<CR>" "Open default terminals"]
       :t [":Rsp<CR>" "Terminal split for RDD"]
       :r ["<Plug>(neoterm-repl-send-line)" "Send line to REPL"]
       :f ["<Plug>(neoterm-repl-send)" "Send form to REPL"]
       :b [":TREPLSendFile<CR>" "Send file to REPL"]
       :cc [":Rspa<CR>" "Put REPL line output to current bufer"]
       :ca [":Rspa block<CR>" "Put REPL block output to current bufer"]
       :i [":<C-W>j:resize 10<CR><C-W>k" "Resize terminal windows"]}
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
   :p {:name "Formatting"
       :r [":Prettier<CR>" "Prettier"]
       :i [":Pint<CR>" "Pint"]} 
   :r "Send to REPL"
   :s [":w<CR>" "Save"]
   :t {:name "Fuzzy file"
       :. "Last search"
       :b "Documentation"
       :d "Dotfiles"
       :e "Files"
       :h "Help"
       :j "Jumplist"
       :n "Neotes"
       :m "Marks"
       :o "Autocommands"
       :p "Projects"
       :q "Quickfix list"
       :y "Neoclip"}
   :tt {:name "Test"}
   :u ["<C-^>" "Switch buffer"]} 
  {:prefix "<leader>"})
