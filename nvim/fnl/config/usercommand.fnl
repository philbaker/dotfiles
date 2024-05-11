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

(util.set-uc "SaveIndexAndReturn" (fn []
                                    (vim.cmd "w")
                                    (vim.cmd ":e index.html")
                                    (vim.cmd ":w")
                                    (vim.cmd ":b #")))

; Node REPL utils
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
  "ChSt"
  (fn []
    (let [file (assert (io.open "n/notebooks/general/stemplate.md"))
          lines (util.split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines))))

(util.set-uc
  "Jote"
  (fn []
    (vim.cmd (.. ":e " "n/journal/" (os.date "!%Y%m%d-daily.md")))))

(util.set-uc
  "Note"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/none/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc
  "Notee"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/all/clo/notebooks/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc
  "Noteh"
  (fn [opts]
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/home/" (os.date "!%Y%m%d-") opts.args)))
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

(util.set-uc
  "EncryptJotes"
  (fn [opts]
    (vim.cmd (.. ":3T bb scripts/encrypt.clj " opts.args)))
  {:nargs "?"})

(util.set-uc
  "DecryptJotes"
  (fn [opts]
    (vim.cmd (.. ":3T bb scripts/decrypt.clj " opts.args)))
  {:nargs "?"})

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

(util.set-uc "Ftd" (fn []
                     (let [items 
                           ["Clojure"
                            "ClojureScript"
                            "HTML/CSS"
                            "JavaScript"
                            "React"
                            "Node"
                            "SQL"]
                            item (. items (math.random (length items)))]
                        (print item))))

(util.set-uc "YankFilePath"
             (fn []
               (vim.fn.setreg "+" (vim.fn.expand "%:~:."))))

{}
