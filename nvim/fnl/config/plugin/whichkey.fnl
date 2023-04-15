(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             util config.util
             which-key which-key}})


; Escape for terminal mode
(util.set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(util.set-key :<C-R> "<C-R>" false)

(util.set-key :<leader>o "<ESC>jcc" true)
(util.set-key :<localleader>o "k==o" true)

; write Jasmine test from rich comment
(util.set-key :<leader>pj "f;xIexpect(<ESC>A).toBe(<ESC>JxA);<ESC>" false)
; turn it back into a comment
(util.set-key :<leader>pk "/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^" false)

(which-key.setup {:triggers_blacklist {:n ["'" "\""]}})

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
   :e {:name "Terminal"}
   :f "Undo tree"
   :g {:name "Git"
       :g [":tab Git<CR>" "Git status"]
       :l [":tab Git log<CR>" "Git log"]
       :a [":Git add .<CR>" "Git add ."]
       :p [":Git push<CR>" "Git push"]
       :c [":Git checkout " "Git checkout"]}
   :gh {:name "GitGutter"}
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
       :p "Previous diagnostic"}
   :m {:name "Meta"
       :ps [":SaveIndexAndReturn<CR>" "Vite save / reload"]
       :n [":set invnumber<CR>" "Toggle current line number"]
       :c [":ClerkShow<CR>" "Show Clerk notebook"]
       :jc [":Jac<CR>" "Compile Java"]
       :jr [":Jar<CR>" "Run Java"]
       :je [":JSRemoveExportSave<CR>" "JS remove export"]
       :jeb ["$V%:s/export //g<CR>" "JS remove in block"]
       :jv [":JSRemoveExportSave<CR>" "JS replace const with var"]
       :jt [":JSRemoveLet<CR>" "JS remove let"]}
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
