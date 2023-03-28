(module config.usercommand
  {autoload {a aniseed.core
             helper config.helper}})

; Build processes
(vim.api.nvim_create_user_command 
  "Nbb"
  (fn [opts] 
    (vim.cmd (.. "1T nbb nrepl-server :port " opts.args)))
  {:nargs "?"})

(vim.api.nvim_create_user_command 
  "Shw"
  (fn [] 
    (vim.cmd "1T npm run shadow:watch"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Shr"
  (fn [] 
    (vim.cmd "1T npm run shadow:release"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Tww"
  (fn [] 
    (vim.cmd "1T npm run tailwind:watch"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Twr"
  (fn [] 
    (vim.cmd "1T npm run tailwind:release"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Npw"
  (fn [] (vim.cmd "1T npm run watch"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Npr" 
  (fn [] (vim.cmd "2T npm run prod"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Sq"
  (fn [] 
    (vim.cmd "w")
    (vim.cmd "3T npx squint %"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Sqall"
  (fn [] 
    (vim.cmd "w")
    (vim.cmd "3T npx squint compile **/*.cljs"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Clj"
  (fn [] 
    (vim.cmd "1T clj -A:dev"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Sqr"
  (fn [] 
    (vim.cmd "3T bb mjs_to_js.clj ./pages"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "ClerkShow"
  (fn []
    (do
      (vim.cmd "w")
      (vim.cmd (.. "ConjureEval (clerk/show! \"" (.. "notebooks/" (vim.fn.expand "%:t"))"\")"))))
{:bang false})

(vim.api.nvim_create_user_command
  "Jac"
  (fn []
    (vim.cmd (.. "3T javac " (vim.fn.expand "%:t"))))
  {:bang false})

(vim.api.nvim_create_user_command
  "Jar"
  (fn []
    (vim.cmd (.. "3T java " (vim.fn.expand "%:t:r"))))
  {:bang false})

(vim.api.nvim_create_user_command
  "Cljfmt"
  (fn []
    (vim.cmd "3T clj -M:cljfmt %"))
  {:bang false})

(vim.api.nvim_create_user_command
  "Phr"
  (fn []
    (vim.cmd (.. "2T vendor/bin/phel run %")))
  {:bang false})

; Node REPL helpers
(vim.api.nvim_create_user_command
  "Rex"
  (fn []
    (vim.cmd ":%s/export //g")
    (vim.cmd ":w"))
  {:bang false})

(vim.api.nvim_create_user_command
  "Rco"
  (fn []
    (vim.cmd ":%s/const/var/g")
    (vim.cmd ":w"))
  {:bang false})

(vim.api.nvim_create_user_command
  "Rle"
  (fn []
    (vim.cmd ":%s/let")
    (vim.cmd ":w"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Pec"
  (fn [] 
    (vim.cmd "w")
    (vim.cmd ":e index.html")
    (vim.cmd ":w")
    (vim.cmd ":b #"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Pint"
  (fn []
    (do
      (vim.cmd ":w")
      (vim.cmd (.. "2T pint " (vim.fn.expand "%:p")))
      (vim.cmd ":sleep 300m")
      (vim.cmd ":e %")))
{:bang false})

; Note helpers
(vim.api.nvim_create_user_command
  "ChTest"
  (fn []
    (let [file (assert (io.open (.. (os.getenv "HOME") "/neotes/all/01-checklists/dev-testing.md")))
          lines (helper.split-string-by-line (file:read "*a"))]
      (file:close)
      (vim.api.nvim_buf_set_lines 0 -1 -1 false lines)))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Sv"
  (fn [opts]
    (helper.ag-outside-cwd "/dotfiles/nvim" opts.args))
  {:nargs "?"})

(vim.api.nvim_create_user_command 
  "Note"
  (fn [opts] 
    (vim.cmd (.. ":e " (os.getenv "HOME") "/neotes/all/" (os.date "!%Y%m%d-") opts.args)))
  {:nargs "?"})

(vim.api.nvim_create_user_command 
  "Sn"
  (fn [opts]
    (let [current-dir (vim.fn.getcwd)]
      (helper.ag-outside-cwd "/neotes" opts.args)))
  {:nargs "?"})

(vim.api.nvim_create_user_command 
  "En"
  (fn []
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/encrypt.clj && cd " current-dir))))
{:bang false})

(vim.api.nvim_create_user_command 
  "De"
  (fn []
    (let [current-dir (vim.fn.getcwd)]
      (vim.cmd (.. ":3T cd ~/neotes && bb scripts/decrypt.clj && cd " current-dir))))
{:bang false})

; Dev helpers
(vim.api.nvim_create_user_command 
  "Npxr"
  (fn []
    (helper.replace-pixel-rem))
{:bang false})

(vim.api.nvim_create_user_command 
  "Nrpx"
  (fn []
    (helper.replace-rem-pixel))
{:bang false})

(vim.api.nvim_create_user_command 
  "Nhr"
  (fn []
    (helper.replace-hex-rgb))
{:bang false})

(vim.api.nvim_create_user_command 
  "Svg"
  (fn [opts]
    (helper.insert-optimised-svg opts.args))
{:nargs "?"})
