(module config.plugin.whichkey
  {autoload {nvim aniseed.nvim
             util config.util
             which-key which-key}})

; General mapping
(util.set-key :<leader>ps ":SaveIndexAndReturn" false)

; Save file
(util.set-key :<localleader>s ":Sq<CR>:Sqr<CR>" false)

; Escape for terminal mode
(util.set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(util.set-key :<C-R> "<C-R>" false)

(util.set-key :<leader>o "<ESC>jcc" true)
(util.set-key :<localleader>o "k==o" true)

; Toggle line numbers
(util.set-key :<leader>pn ":set invnumber<CR>" true)

; Clerk
(util.set-key :<localleader>cs ":ClerkShow<CR>" false)

; Compile Java
(util.set-key :<localleader>jc ":Jac<CR>" false)

; Run Java
(util.set-key :<localleader>jr ":Jar<CR>" false)

; Node REPL utils
(util.set-key :<leader>pe ":Rex<CR>" false)
(util.set-key :<leader>pc ":Rco<CR>" false)
(util.set-key :<leader>pt ":Rle<CR>" false)
(util.set-key :<leader>pf "$V%:s/export //g<CR>" false)

; write Jasmine test from rich comment
(util.set-key :<leader>pj "f;xIexpect(<ESC>A).toBe(<ESC>JxA);<ESC>" false)
; turn it back into a comment
(util.set-key :<leader>pk "/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^" false)

; Quick fix list
(util.set-key :<leader>co ":cope<CR>" true)
(util.set-key :<leader>cc ":ccl<CR>" true)
(util.set-key :<leader>cn ":cn<CR>" true)
(util.set-key :<leader>cp ":cp<CR>" true)

(which-key.setup {:triggers_blacklist {:n ["'"]}})

(which-key.register 
  {:. "Buffer list"
   :- [":Dirbuf<CR>" "Dirbuf"]
   :<CR> [":noh<CR>" "Clear highlights"]
   :a {:name "Fuzzy grep"
       :a "Grep"
       :d "Dotfiles grep"
       :n "Neotes grep"
       :r "Grep with args"}
   :c {:name "LSP"}
   :e {:name "Terminal"}
   :f "Undo tree"
   :g {:name "Git"
       :g [":tab Git<CR>" "Git status"]
       :l [":tab Git log<CR>" "Git log"]
       :a [":Git add ." "Git add ."]
       :p [":Git push" "Git push"]
       :c [":Git checkout " "Git checkout"]}
   :gh {:name "GitGutter"}
   :m {:name "Meta"
       }
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
