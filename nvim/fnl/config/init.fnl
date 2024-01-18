(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

; Don't wrap lines
(nvim.ex.set :nowrap)

; Global options
(let [options
      {:backup true
       :swapfile false
       :termguicolors true
       :colorcolumn "80"
       ; Open new horizontal panes on down pane
       :splitbelow true
       ; Open new vertical panes on right pane
       :splitright true
       ; Auto completion
       :completeopt "menuone,noselect"
       ; Feedback when using substitute
       :inccommand "nosplit"
       ; Case insensitive search
       :ignorecase true
       ; Smart search case
       :smartcase true
       ; Keep lsp column open to prevent text jumping
       :signcolumn "yes"
       ; Persistent undo
       :undofile true
       :undodir (vim.fn.expand "~/.undodir")
       ; Confirmation when closing unsaved file
       :confirm true
       ; Maintain indent when wrapping indented lines
       :breakindent true
       :list true
       ; Share clipboard
       :clipboard "unnamedplus"
       :scrolloff 3
       :number true
       :relativenumber true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

; Stop repeating comment character on new line
(nvim.ex.autocmd :FileType :* "setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

; Follow terminal output
(nvim.ex.let "neoterm_autoinsert=1")

; Open quickfix list at bottom
(nvim.ex.autocmd :FileType :qf "wincmd J")

(vim.cmd "autocmd BufNewFile,BufRead *.phel set syntax=clojure")

; Set colorscheme
; (vim.cmd "colorscheme tokyonight")

; Don't keep backup in local dir
(vim.opt.backupdir:remove ".")

; Set custom list chars
(set vim.opt.listchars {:tab "▸ " :trail "·"})

;space is reserved to be lead
(nvim.set_keymap :n :<space> :<nop> {:noremap true})

; Utils

(fn split-string-by-line [str]
  "Splits a multiline string into an array of lines"
  (let [words []]
    (each [line (string.gmatch str "([^\n]*)\n?")]
      (if (not= (string.len line) 0)
        (table.insert words line)))
    words))

(fn remove-all-spaces [str]
  "Removes all spaces from string"
  (tostring (string.gsub str "%s+" "")))

(fn nbb-script [script args]
  "Calls external nbb script"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (remove-all-spaces 
      (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args)))))

(fn nbb-script-spaces [script args]
  "Calls external nbb scripts"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args))))

(fn node-script [script args]
  "Calls external node script"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/")]
    (remove-all-spaces 
      (vim.fn.system (.. "node " scripts-dir script args)))))

(fn replace-pixel-rem []
  "Replaces pixel value with rem in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "pixel_to_rem" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-rem-pixel []
  "Replaces rem value with pixel in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "rem_to_pixel" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-hex-rgb []
  "Replaces hex colour value with rgb in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "hex_to_rgb" (.. "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-rgb-hex []
  "Replaces rgb colour value with hex in place"
  (let [current-word (vim.call "expand" "<cWORD>")
        replacement (nbb-script "rgb_to_hex" (.. "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diWi" replacement))))

(fn tailwind-colors [arg]
  (let [current-word (vim.call "expand" "<cWORD>")
        replacement (node-script "tw-colors/index.mjs" (.. " " arg " " "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diWi" replacement))))

(fn tailwind-class-to-hex []
  "Replaces a Tailwind class name with its hex value"
  (tailwind-colors "ch"))

(fn tailwind-hex-to-class []
  "Replaces a hex value with its Tailwind class name"
  (tailwind-colors "hc"))

(fn system-os []
  "Returns Linux or Darwin"
  (. (vim.loop.os_uname) "sysname"))

(fn insert-optimised-svg [file-name id]
  (vim.api.nvim_buf_set_lines 0 -1 -1 false 
                              (split-string-by-line 
                                (if id
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name id))
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name))))))

(fn set-key [key action noremap ?mode]
  (nvim.set_keymap (or ?mode :n) key action {:noremap noremap}))

(fn set-uc [name command ?opts]
  (vim.api.nvim_create_user_command
    name
    command
    (or ?opts {:bang false})))

(fn getcwf []
  "Returns abbreviated current working directory"
  (tostring
    (string.gsub
      (vim.fn.getcwd)
      (os.getenv "HOME")
      "")))

(fn cmdtc [cmd]
  "A shorter version of nvim_replace_termcodes"
   (vim.cmd (vim.api.nvim_replace_termcodes (.. "normal " cmd) true true true)))

; Mapping

(set vim.o.timeoutlen 500)

; Leader mapping
(set-key :<space> :<nop>)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

; Resize windows
(set-key :<S-Up> "<C-w>+" true)
(set-key :<S-Down> "<C-w>-" true)
(set-key :<S-Right> "<C-w>>" true)
(set-key :<S-Left> "<C-w><" true)

; Escape for terminal mode
(set-key :<Esc> "<C-\\><C-n>" false :t)

; Restore default redo
(set-key :<C-R> "<C-R>" false)

; User commands

; Build processes
(set-uc
  "BbRepl"
  (fn [opts]
    (vim.cmd (.. "1T bb nrepl-server " opts.args)))
  {:nargs "?"})

(set-uc
  "NbbRepl"
  (fn [opts]
    (vim.cmd (.. "1T nbb nrepl-server :port " opts.args)))
  {:nargs "?"})

(set-uc "NPMShadowWatch" #(vim.cmd "1T npm run shadow:watch"))

(set-uc "NPMShadowRelease" #(vim.cmd "1T npm run shadow:release"))

(set-uc "NPMTailwindWatch" #(vim.cmd "2T npm run tailwind:watch"))

(set-uc "NPMTailwindRelease" #(vim.cmd "2T npm run tailwind:release"))

(set-uc "NPMRunWatch" #(vim.cmd "1T npm run watch"))

(set-uc "NPMRunProd" #(vim.cmd "1T npm run prod"))

(set-uc "ClojureStartRepl" #(vim.cmd "1T clj -A:dev"))

(set-uc "Sq" (fn []
                    (vim.cmd "w")
                    (vim.cmd "3T npx squint %")))

(set-uc "Sqall" (fn []
                       (vim.cmd "w")
                       (vim.cmd "3T npx squint compile **/*.cljs")))


(set-uc "Sqr" #(vim.cmd "3T bb mjs_to_js.clj ./pages"))

(set-uc
  "ClerkShow"
  (fn []
    (do
      (vim.cmd "w")
      (vim.cmd (.. "ConjureEval (clerk/show! \"" (.. "notebooks/" (vim.fn.expand "%:t"))"\")")))))

(set-uc "Jac" #(vim.cmd (.. "3T javac " (vim.fn.expand "%:t"))))

(set-uc "Jar" #(vim.cmd (.. "3T java " (vim.fn.expand "%:t:r"))))

(set-uc "Cljfmt" #(vim.cmd "3T clj -M:cljfmt %"))

(set-uc "Phr" #(vim.cmd (.. "2T vendor/bin/phel run %")))

(set-uc "Nter" (fn []
                     (vim.cmd "normal mZ")
                     (vim.cmd "1Topen")
                     (vim.cmd "normal mA")
                     (vim.cmd "2Topen")
                     (vim.cmd "normal mB")
                     (vim.cmd "3Topen")
                     (vim.cmd "normal mC")
                     (vim.cmd "4Topen")
                     (vim.cmd "normal mD")
                     (vim.cmd "normal 'Z")
                     (vim.cmd "stopinsert")))

; Node REPL utils
(set-uc "JSRemoveExport" (fn [] 
                     (vim.cmd ":%s/export //g") 
                     (vim.cmd ":w")))

(set-uc "JSReplaceConstWithVar" (fn []
                     (vim.cmd ":%s/const/var/g")
                     (vim.cmd ":w")))

(set-uc "JSRemoveLet" (fn []
                     (vim.cmd ":%s/let")
                     (vim.cmd ":w")))

(set-uc "SaveIndexAndReturn" (fn []
                     (vim.cmd "w")
                     (vim.cmd ":e index.html")
                     (vim.cmd ":w")
                     (vim.cmd ":b #")))

(set-uc "Pint" (fn []
                      (do
                        (vim.cmd ":w")
                        (vim.cmd (.. "2T pint " (vim.fn.expand "%:p")))
                        (vim.cmd ":sleep 300m")
                        (vim.cmd ":e %"))))

; Note utils
(set-uc
  "ChTest"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/dev-testing.md")))
          lines (split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(set-uc
  "ChTrello"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/trello-template.md")))
          lines (split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(set-uc
  "AbTest"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/ab-testing.md")))
          lines (split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(set-uc
  "VimSexpKeyBindings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/vim-sexp-key-bindings.md"))))

(set-uc
  "VimSexpKeyMappings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/20230411-vim-sexp-mappings.md"))))

(set-uc
  "VimSurroundKeyMappings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/20230722-vim-surround.md"))))

(set-uc
  "Sv"
  (fn [opts]
    (ag-outside-cwd "/dotfiles/nvim" opts.args))
  {:nargs "?"})

(set-uc
  "Note"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(set-uc
  "Notee"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/all/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(set-uc
  "Noteh"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/home/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(set-uc
  "Sn"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (ag-outside-cwd "/neotes" opts.args)))
  {:nargs "?"})

(set-uc
  "EncryptNotes"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/encrypt.clj " opts.args " && cd " current-dir))))
  {:nargs "?"})

(set-uc
  "DecryptNotes"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/decrypt.clj " opts.args " && cd " current-dir))))
  {:nargs "?"})

(set-uc "Qtc" (fn []
                    (vim.cmd "tabe")
                    (vim.cmd "cope")))

; Dev utils
(set-uc "PixelToRem" #(replace-pixel-rem))

(set-uc "RemToPixel" #(replace-rem-pixel))

(set-uc "HexToRgb" #(replace-hex-rgb))

(set-uc "RgbToHex" (fn []
                          (vim.cmd "normal dt(r[f)r]^")
                          (vim.cmd "normal f xf x")
                          (replace-rgb-hex)))

(set-uc "TailwindHexToClass" #(tailwind-hex-to-class))

(set-uc "TailwindClassToHex" #(tailwind-class-to-hex))

(set-uc
  "Svg"
  (fn [opts]
    (insert-optimised-svg opts.args))
  {:nargs "?"})

; REPL

(set-uc
  "Resize10"
  (fn []
    (cmdtc "<C-W>j")
    (vim.cmd "resize 10")
    (cmdtc "<C-W>k")))

; Sets up a terminal split for RDD
(set-uc
  "Rsp"
  (fn []
    (vim.cmd "sp")
    (vim.cmd "normal 'C")
    (vim.cmd "resize 10")
    (cmdtc "<C-w>k"))
  {:nargs "?"})

; Puts REPL output in code buffer
(set-uc 
  "Rspa"
  (fn [opts]
    (if (not= opts.args "block")
      (cmdtc "<Plug>(neoterm-repl-send-line)"))
    (vim.cmd "sleep 100ms")
    (cmdtc "<C-w>j")
    (vim.cmd "normal G")
    (vim.cmd "normal k")
    (if (= opts.args "block")
      (vim.cmd "normal V%y")
      (vim.cmd "normal yy"))
    (cmdtc "<C-w>k")
    (vim.cmd "normal p")
    (if (= opts.args "block")
      (vim.cmd "normal V%gc")
      (vim.cmd "normal gcc"))
    (cmdtc "<C-w>j")
    (vim.cmd "normal G")
    (cmdtc "<C-w>k"))
  {:nargs "?"})

; Open current file or directory via OS
(set-uc "Open" (fn []
                      (let [path (vim.api.nvim_buf_get_name 0)
                            directory (str.join
                                        "/"
                                        (core.butlast
                                          (str.split path "/")))]
                        (if (= (system-os) "Linux")
                          (os.execute (.. "xdg-open " directory))
                          (os.execute (.. "open -R " directory))))))

{}
