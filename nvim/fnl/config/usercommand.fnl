(module config.usercommand
  {autoload {a aniseed.core
             util config.util}})

; Build processes
(util.set-uc 
  "Nbb"
  (fn [opts] 
    (vim.cmd (.. "1T nbb nrepl-server :port " opts.args)))
  {:nargs "?"})

(util.set-uc "Shw" #(vim.cmd "1T npm run shadow:watch"))

(util.set-uc "Shr" #(vim.cmd "1T npm run shadow:release"))

(util.set-uc "Tww" #(vim.cmd "1T npm run tailwind:watch"))

(util.set-uc "Twr" #(vim.cmd "1T npm run tailwind:release"))

(util.set-uc "Npw" #(vim.cmd "1T npm run watch"))

(util.set-uc "Npr" #(vim.cmd "2T npm run prod"))

(util.set-uc "Sq" (fn [] 
                    (vim.cmd "w")
                    (vim.cmd "3T npx squint %")))

(util.set-uc "Sqall" (fn [] 
                       (vim.cmd "w")
                       (vim.cmd "3T npx squint compile **/*.cljs")))

(util.set-uc "Clj" #(vim.cmd "1T clj -A:dev"))

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

; Node REPL utils
(util.set-uc "Rex" (fn [] 
                     (vim.cmd ":%s/export //g") 
                     (vim.cmd ":w")))

(util.set-uc "Rco" (fn []
                     (vim.cmd ":%s/const/var/g")
                     (vim.cmd ":w")))

(util.set-uc "Rle" (fn []
                     (vim.cmd ":%s/let")
                     (vim.cmd ":w")))

(util.set-uc "Pec" (fn [] 
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
  "Sv"
  (fn [opts]
    (util.ag-outside-cwd "/dotfiles/nvim" opts.args))
  {:nargs "?"})

(util.set-uc 
  "Note"
  (fn [opts] 
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/all/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(util.set-uc 
  "Sn"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (util.ag-outside-cwd "/neotes" opts.args)))
  {:nargs "?"})

(util.set-uc 
  "En"
  (fn []
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/encrypt.clj && cd " current-dir)))))

(util.set-uc 
  "De"
  (fn []
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/decrypt.clj && cd " current-dir)))))

; Dev utils
(util.set-uc "Npxr" #(util.replace-pixel-rem))

(util.set-uc "Nrpx" #(util.replace-rem-pixel))

(util.set-uc "Nhr" #(util.replace-hex-rgb))

(util.set-uc 
  "Svg"
  (fn [opts]
    (util.insert-optimised-svg opts.args))
{:nargs "?"})
