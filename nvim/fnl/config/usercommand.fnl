(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local util (autoload :config.util))

; User commands

; Build processes
(util.set-uc
  "BbRepl"
  (fn [opts]
    (vim.cmd (.. "1T bb nrepl-server " opts.args)))
  {:nargs "?"})

(util.set-uc
  "NbbRepl"
  (fn [opts]
    (vim.cmd (.. "1T nbb nrepl-server :port " opts.args)))
  {:nargs "?"})

(util.set-uc "NPMShadowWatch" #(vim.cmd "1T npm run shadow:watch"))

(util.set-uc "NPMShadowRelease" #(vim.cmd "1T npm run shadow:release"))

(util.set-uc "NPMTailwindWatch" #(vim.cmd "2T npm run tailwind:watch"))

(util.set-uc "NPMTailwindRelease" #(vim.cmd "2T npm run tailwind:release"))

(util.set-uc "NPMRunWatch" #(vim.cmd "1T npm run watch"))

(util.set-uc "NPMRunProd" #(vim.cmd "1T npm run prod"))

(util.set-uc "ClojureStartRepl" #(vim.cmd "1T clj -A:dev"))

(util.set-uc "Sq" (fn []
                    (vim.cmd "w")
                    (vim.cmd "3T npx squint %")))

(util.set-uc "Sqall" (fn []
                       (vim.cmd "w")
                       (vim.cmd "3T npx squint compile **/*.cljs")))

(util.set-uc "Sqr" #(vim.cmd "3T bb mjs_to_js.clj ./pages"))

(util.set-uc
  "ClerkShow"
  (fn []
    (do
      (vim.cmd "w")
      (vim.cmd (.. "ConjureEval (clerk/show! \"" (.. "notebooks/" (vim.fn.expand "%:t"))"\")")))))

(util.set-uc "Jac" #(vim.cmd (.. "3T javac " (vim.fn.expand "%:t"))))

(util.set-uc "Jar" #(vim.cmd (.. "3T java " (vim.fn.expand "%:t:r"))))

(util.set-uc "Cljfmt" #(vim.cmd "3T clj -M:cljfmt %"))

(util.set-uc "Phr" #(vim.cmd (.. "2T vendor/bin/phel run %")))

(util.set-uc "Nter" (fn []
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
(util.set-uc "JSRemoveExport" (fn [] 
                                (vim.cmd ":%s/export //g") 
                                (vim.cmd ":w")))

(util.set-uc "JSReplaceConstWithVar" (fn []
                                       (vim.cmd ":%s/const/var/g")
                                       (vim.cmd ":w")))

(util.set-uc "JSRemoveLet" (fn []
                             (vim.cmd ":%s/let")
                             (vim.cmd ":w")))

(util.set-uc "SaveIndexAndReturn" (fn []
                                    (vim.cmd "w")
                                    (vim.cmd ":e index.html")
                                    (vim.cmd ":w")
                                    (vim.cmd ":b #")))

(util.set-uc "Pint" (fn []
                      (do
                        (vim.cmd ":w")
                        (vim.cmd (.. "2T pint " (vim.fn.expand "%:p")))
                        (vim.cmd ":sleep 300m")
                        (vim.cmd ":e %"))))

; Note utils
(util.set-uc
  "ChTest"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/dev-testing.md")))
          lines (util.split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(util.set-uc
  "ChTrello"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/trello-template.md")))
          lines (util.split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(util.set-uc
  "AbTest"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/ab-testing.md")))
          lines (util.split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(util.set-uc
  "VimSexpKeyBindings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/vim-sexp-key-bindings.md"))))

(util.set-uc
  "VimSexpKeyMappings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/20230411-vim-sexp-mappings.md"))))

(util.set-uc
  "VimSurroundKeyMappings"
  (fn []
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/20230722-vim-surround.md"))))

(util.set-uc
  "Sv"
  (fn [opts]
    (ag-outside-cwd "/dotfiles/nvim" opts.args))
  {:nargs "?"})

(util.set-uc
  "Note"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc
  "Notee"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/all/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc
  "Noteh"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/home/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc
  "Sn"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (ag-outside-cwd "/neotes" opts.args)))
  {:nargs "?"})

(util.set-uc
  "EncryptNotes"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/encrypt.clj " opts.args " && cd " current-dir))))
  {:nargs "?"})

(util.set-uc
  "DecryptNotes"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/decrypt.clj " opts.args " && cd " current-dir))))
  {:nargs "?"})

(util.set-uc "Qtc" (fn []
                     (vim.cmd "tabe")
                     (vim.cmd "cope")))

; Dev utils
(util.set-uc "PixelToRem" #(replace-pixel-rem))

(util.set-uc "RemToPixel" #(replace-rem-pixel))

(util.set-uc "HexToRgb" #(replace-hex-rgb))

(util.set-uc "RgbToHex" (fn []
                          (vim.cmd "normal dt(r[f)r]^")
                          (vim.cmd "normal f xf x")
                          (replace-rgb-hex)))

(util.set-uc "TailwindHexToClass" #(tailwind-hex-to-class))

(util.set-uc "TailwindClassToHex" #(tailwind-class-to-hex))

(util.set-uc
  "Svg"
  (fn [opts]
    (insert-optimised-svg opts.args))
  {:nargs "?"})

; REPL

(util.set-uc
  "Resize10"
  (fn []
    (util.cmdtc "<C-W>j")
    (vim.cmd "resize 10")
    (util.cmdtc "<C-W>k")))

; Sets up a terminal split for RDD
(util.set-uc
  "Rsp"
  (fn []
    (vim.cmd "sp")
    (vim.cmd "normal 'C")
    (vim.cmd "resize 10")
    (util.cmdtc "<C-w>k"))
  {:nargs "?"})

; Puts REPL output in code buffer
(util.set-uc
  "Rspa"
  (fn [opts]
    (if (not= opts.args "block")
      (util.cmdtc "<Plug>(neoterm-repl-send-line)"))
    (vim.cmd "sleep 100ms")
    (util.cmdtc "<C-w>j")
    (vim.cmd "normal G")
    (vim.cmd "normal k")
    (if (= opts.args "block")
      (vim.cmd "normal V%y")
      (vim.cmd "normal yy"))
    (util.cmdtc "<C-w>k")
    (vim.cmd "normal p")
    (if (= opts.args "block")
      (vim.cmd "normal V%gc")
      (vim.cmd "normal gcc"))
    (util.cmdtc "<C-w>j")
    (vim.cmd "normal G")
    (util.cmdtc "<C-w>k"))
  {:nargs "?"})

; Open current file or directory via OS
(util.set-uc "Open" (fn []
                      (let [path (vim.api.nvim_buf_get_name 0)
                            directory (str.join
                                        "/"
                                        (core.butlast
                                          (str.split path "/")))]
                        (if (= (system-os) "Linux")
                          (os.execute (.. "xdg-open " directory))
                          (os.execute (.. "open -R " directory))))))

(util.set-uc "Ftd" (fn []
                     (let [items ["W - HTML/CSS"
                                  "W - TypeScript/JavaScript/React/Node"
                                  "G - Clojure(Script)"
                                  "W - SQL"
                                  "V - Vim/Fennel/Lua/Keyboard"]
                            item (. items (math.random (length items)))]
                        (print item))))

{}

(util.set-uc "YankFilePath"
             (fn []
               (vim.fn.setreg "+" (vim.fn.expand "%:~:."))))
