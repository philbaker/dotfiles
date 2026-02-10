(local {: autoload} (require :nfnl.module))
(local wk (require "which-key"))

(fn km [key opts what]
  (do (tset opts 1 key) (tset opts 2 what) opts))

(wk.add
  [; top-level
   (km "<leader>." {:desc "Buffer list"} ":lua require('telescope.builtin').buffers()<CR>")
   (km "<leader><CR>" {:desc "Clear highlights"} ":noh<CR>")

   ; fuzzy grep
   (km "<leader>a" {:group "Fuzzy grep"})
   (km "<leader>aa" {:desc "Grep with args"} ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
   (km "<leader>ad" {:desc "Dotfiles with args"} ":lua require('telescope').extensions.live_grep_args.live_grep_args({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>")
   (km "<leader>an" {:desc "Neotes with args"} ":lua require('telescope').extensions.live_grep_args.live_grep_args({search_dirs={vim.fn.expand('~/neotes')},additional_args={'--no-ignore'}})<CR>")

   ; conjure
   (km "<leader>c" {:group "Conjure"})

   ; test
   (km "<leader>d" {:group "Test"})
   (km "<leader>dn" {:desc "Nearest"} ":2T :<CR> :TestNearest<CR>")
   (km "<leader>df" {:desc "File"} ":2T :<CR> :TestFile<CR>")
   (km "<leader>ds" {:desc "Suite"} ":2T :<CR> :TestSuite<CR>")
   (km "<leader>dp" {:desc "Previous"} ":2T :<CR> :TestLast<CR>")
   (km "<leader>da" {:desc "Last run test code"} ":TestVisit<CR>")

   ; git
   (km "<leader>g" {:group "Git"})
   (km "<leader>gg" {:desc "Git status"} ":tab Git<CR>")
   (km "<leader>gl" {:desc "Git log"} ":tab Git log<CR>")
   (km "<leader>ga" {:desc "Git add ."} ":Git add .<CR>")
   (km "<leader>gp" {:desc "Git push"} ":Git push<CR>")
   (km "<leader>gc" {:desc "Git checkout"} ":Git checkout ")

   ; harpoon
   (km "<leader>h" {:group "Harpoon"})
   (km "<leader>hf" {:desc "Add file"} ":lua require('harpoon.mark').add_file()<CR>")
   (km "<leader>hh" {:desc "Show menu"} ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
   (km "<leader>ha" {:desc "Nav file 1"} ":lua require('harpoon.ui').nav_file(1)<CR>")
   (km "<leader>hb" {:desc "Nav file 2"} ":lua require('harpoon.ui').nav_file(2)<CR>")
   (km "<leader>hc" {:desc "Nav file 3"} ":lua require('harpoon.ui').nav_file(3)<CR>")
   (km "<leader>hd" {:desc "Nav file 4"} ":lua require('harpoon.ui').nav_file(4)<CR>")
   (km "<leader>he" {:desc "Nav file 5"} ":lua require('harpoon.ui').nav_file(5)<CR>")
   (km "<leader>hp" {:desc "Nav prev"} ":lua require('harpoon.ui').nav_prev()<CR>")
   (km "<leader>hn" {:desc "Nav next"} ":lua require('harpoon.ui').nav_next()<CR>")

   ; lsp
   (km "<leader>l" {:group "LSP"})
   (km "<leader>la" {:desc "Fuzzy diagnostics"})
   (km "<leader>lb" {:desc "Fuzzy references"})
   (km "<leader>lc" {:desc "Fuzzy implementations"})
   (km "<leader>ld" {:desc "Declaration"})
   (km "<leader>lt" {:desc "Type definition"})
   (km "<leader>lh" {:desc "Signature help"})
   (km "<leader>lr" {:desc "Rename"})
   (km "<leader>le" {:desc "Open float"})
   (km "<leader>lq" {:desc "Set loclist"})
   (km "<leader>lf" {:desc "Format"})
   (km "<leader>ln" {:desc "Next diagnostic"})
   (km "<leader>lp" {:desc "Previous diagnostic"})
   (km "<leader>ls" {:desc "Document symbols"})

   ; misc
   (km "<leader>m" {:group "Misc"})
   (km "<leader>ma" {:desc "UndoTreeToggle"} ":UndotreeToggle<CR>")
   (km "<leader>mm" {:desc "Scratch file"} ":e ~/dotfiles/nvim/fnl/config/scratch.fnl<CR>")
   (km "<leader>ms" {:desc "Vite save / reload"} ":SaveIndexAndReturn<CR>")
   (km "<leader>mn" {:desc "Toggle current line number"} ":set invnumber<CR>")
   (km "<leader>mc" {:desc "Show Clerk notebook"} ":ClerkShow<CR>")
   (km "<leader>mjc" {:desc "Compile Java"} ":Jac<CR>")
   (km "<leader>mjr" {:desc "Run Java"} ":Jar<CR>")
   (km "<leader>mje" {:desc "JS remove export"} ":JSRemoveExportSave<CR>")
   (km "<leader>mjeb" {:desc "JS remove in block"} "$V%:s/export //g<CR>")
   (km "<leader>mjv" {:desc "JS replace const with var"} ":JSRemoveExportSave<CR>")
   (km "<leader>mjt" {:desc "JS remove let"} ":JSRemoveLet<CR>")
   (km "<leader>mpj" {:desc "Test from rich comment"} "f;xIexpect(<ESC>A).toBe(<ESC>JxA);<ESC>")
   (km "<leader>mpk" {:desc "Turn test back into comment"} "/to<CR>hxi<CR><ESC> <CR>wdt(%x^xkdt(%x^xA;<ESC>^")
   (km "<leader>mea" {:desc "Encrypt all"} ":EncryptNotes all<CR>")
   (km "<leader>mda" {:desc "Decrypt all"} ":DecryptNotes all<CR>")
   (km "<leader>meh" {:desc "Encrypt home"} ":EncryptNotes home<CR>")
   (km "<leader>mdh" {:desc "Decrypt home"} ":DecryptNotes home<CR>")
   (km "<leader>mtw" {:desc "Replace Tailwind string with vector of keywords"} "vi\":s/\\%V / :/g<cr>f\"a:<esc>hr[f\"r]:noh<cr>")
   (km "<leader>mts" {:desc "Replace Tailwind vector of keywords with a string"} "vi]:s/\\%V :/ /g<cr>f[f:xhr\"f]r\"")
   (km "<leader>mtv" {:desc "Replace Tailwind vector of keywords with vector of strings"} "vi[:s/\\%V:/\"/g<cr>f[vi[:s/\\%V /\" /g<cr>f]i<space><esc>r\":noh<cr>")

   ; utils
   (km "<leader>mu" {:group "Utils"})
   (km "<leader>mur" {:desc "Pixel to Rem"} ":PixelToRem<CR>")
   (km "<leader>mup" {:desc "Rem to Pixel"} ":RemToPixel<CR>")
   (km "<leader>mug" {:desc "Hex to RGB"} ":HexToRgb<CR>")
   (km "<leader>muh" {:desc "RGB to Hex"} ":RgbToHex<CR>")
   (km "<leader>muth" {:desc "Tailwind class to hex"} ":TailwindClassToHex<CR>")
   (km "<leader>mutc" {:desc "Tailwind hex to class"} ":TailwindHexToClass<CR>")

   ; neoclip
   (km "<leader>my" {:group "Neoclip"})
   (km "<leader>myy" {:desc "Put selected yank into plus register"} ":Telescope neoclip plus<CR>")

   ; terminal
   (km "<leader>n" {:group "Terminal"})
   (km "<leader>nn" {:desc "Open default terminals"} ":Nter<CR>")
   (km "<leader>nt" {:desc "Terminal split for RDD"} ":Rsp<CR>")
   (km "<leader>nr" {:desc "Send line to REPL"} "<Plug>(neoterm-repl-send-line)")
   (km "<leader>nf" {:desc "Send form to REPL"} "<Plug>(neoterm-repl-send)")
   (km "<leader>nb" {:desc "Send file to REPL"} ":TREPLSendFile<CR>")
   (km "<leader>nc" {:group "REPL"})
   (km "<leader>ncc" {:desc "Put REPL line output to current bufer"} ":Rspa<CR>")
   (km "<leader>nca" {:desc "Put REPL block output to current bufer"} ":Rspa block<CR>")
   (km "<leader>ni" {:desc "Make bottom split size 10"} ":Resize10<CR>")

   ; formatting
   (km "<leader>p" {:group "Formatting"})
   (km "<leader>pr" {:desc "Prettier"} ":Prettier<CR>")
   (km "<leader>pi" {:desc "Pint"} ":Pint<CR>")

   ; quickfix list
   (km "<leader>q" {:group "Quickfix list"})
   (km "<leader>qo" {:desc "Open Quickfix list"} ":cope<CR>")
   (km "<leader>qc" {:desc "Close Quickfix list"} ":ccl<CR>")
   (km "<leader>qn" {:desc "Next Quickfix item"} ":cn<CR>")
   (km "<leader>qp" {:desc "Previous Quickfix item"} ":cp<CR>")

   ; location list
   (km "<leader>ql" {:group "Location list"})
   (km "<leader>qlo" {:desc "Open location list"} ":lopen<CR>")
   (km "<leader>qlc" {:desc "Close location list"} ":lcl<CR>")
   (km "<leader>qln" {:desc "Next location list item"} ":lnext<CR>")
   (km "<leader>qlp" {:desc "Previous location list item"} ":lprev<CR>")

   ; save
   (km "<leader>s" {:desc "Save"} ":w<CR>")

   ; fuzzy file
   (km "<leader>t" {:group "Fuzzy file"})
   (km "<leader>t." {:desc "Last search"} ":lua require ('telescope.builtin').resume()<CR>")
   (km "<leader>tc" {:desc "Commands"} ":lua require('telescope.builtin').commands()<CR>")
   (km "<leader>td" {:desc "Dotfiles"} ":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/dotfiles')}})<CR>")
   (km "<leader>tf" {:desc "History"} ":lua require('telescope.builtin').oldfiles()<CR>")
   (km "<leader>tg" {:desc "Git history"} ":lua require('telescope').extensions.git_file_history.git_file_history()<CR>")
   (km "<leader>th" {:desc "Help"} ":lua require('telescope.builtin').help_tags()<CR>")
   (km "<leader>tn" {:desc "Neotes"} ":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/neotes')}, no_ignore=true})<CR>")
   (km "<leader>tm" {:desc "Marks"} ":lua require ('telescope.builtin').marks()<CR>")
   (km "<leader>to" {:desc "Autocommands"} ":lua require ('telescope.builtin').autocommands()<CR>")
   (km "<leader>tp" {:desc "Projects"} ":lua require'telescope'.extensions.project.project{}<CR>")
   (km "<leader>tq" {:desc "Quickfix list"} ":lua require ('telescope.builtin').quickfix()<CR>")
   (km "<leader>tu" {:desc "Undo"} ":lua require('telescope').extensions.undo.undo()<CR>")
   (km "<leader>tw" {:desc "Qn"} ":lua require('telescope.builtin').find_files({search_dirs={vim.fn.expand('~/Dropbox/qn')}})<CR>")
   (km "<leader>ty" {:desc "Neoclip"} ":Telescope neoclip n<CR>")

   ; switch buffer
   (km "<leader>u" {:desc "Switch buffer"} "<C-^>")

   ; browser
   (km "<leader>b" {:desc "Browser buffer"} ":Bro<CR>")

   ; window management
   (km "<leader>w" {:group "Window / Smart Splits"})

   ; move cursor
   (km "<leader>wh" {:desc "Move left"} ":lua require('smart-splits').move_cursor_left()<CR>")
   (km "<leader>wj" {:desc "Move down"} ":lua require('smart-splits').move_cursor_down()<CR>")
   (km "<leader>wk" {:desc "Move up"} ":lua require('smart-splits').move_cursor_up()<CR>")
   (km "<leader>wl" {:desc "Move right"} ":lua require('smart-splits').move_cursor_right()<CR>")
   (km "<leader>wg" {:desc "Move previous"} ":lua require('smart-splits').move_cursor_previous()<CR>")

   ; resize windows
   (km "<leader>H" {:desc "Resize left"} ":lua require('smart-splits').resize_left()<CR>")
   (km "<leader>J" {:desc "Resize down"} ":lua require('smart-splits').resize_down()<CR>")
   (km "<leader>K" {:desc "Resize up"} ":lua require('smart-splits').resize_up()<CR>")
   (km "<leader>L" {:desc "Resize right"} ":lua require('smart-splits').resize_right()<CR>")

   ; swap buffers
   (km "<leader>wH" {:desc "Swap buffer left"} ":lua require('smart-splits').swap_buf_left()<CR>")
   (km "<leader>wJ" {:desc "Swap buffer down"} ":lua require('smart-splits').swap_buf_down()<CR>")
   (km "<leader>wK" {:desc "Swap buffer up"} ":lua require('smart-splits').swap_buf_up()<CR>")
   (km "<leader>wL" {:desc "Swap buffer right"} ":lua require('smart-splits').swap_buf_right()<CR>")

   ; optional: ctrl-movement shortcuts
   (km "<c-h>" {:desc "Move left"} ":lua require('smart-splits').move_cursor_left()<CR>")
   (km "<c-j>" {:desc "Move down"} ":lua require('smart-splits').move_cursor_down()<CR>")
   (km "<c-k>" {:desc "Move up"} ":lua require('smart-splits').move_cursor_up()<CR>")
   (km "<c-l>" {:desc "Move right"} ":lua require('smart-splits').move_cursor_right()<CR>")
   (km "<c-y>" {:desc "Move previous"} ":lua require('smart-splits').move_cursor_previous()<CR>")])

[{1 :folke/which-key.nvim
    :event "VeryLazy"
    :version "*"
    :opts {}}]
