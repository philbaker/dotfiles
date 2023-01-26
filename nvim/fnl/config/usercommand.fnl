(module config.usercommand)

(vim.api.nvim_create_user_command 
  "RebaseMain"
  (fn [] (vim.cmd ":2T git rebase -i main"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "RebaseContinue"
  (fn [] (vim.cmd ":2T git rebase --continue"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "RebaseAbort"
  (fn [] (vim.cmd ":2T git rebase --abort"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "NPMRunWatch"
  (fn [] (vim.cmd "1T npm run watch"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "NPMRunProd" 
  (fn [] (vim.cmd "2T npm run prod"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "NPMStopCheckoutMain"
  (fn [] (vim.cmd ":2Tkill<CR>:2T git checkout .<CR>:2T git checkout main<CR>"))
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
  "Cln"
  (fn [] 
    (vim.cmd "1T clj -A:dev"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Sqr"
  (fn [] 
    (vim.cmd "3T bb mjs_to_js.clj ./pages"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Bbn"
  (fn [] 
    (vim.cmd "1T bb nrepl-server 1667"))
  {:bang false})

(vim.api.nvim_create_user_command 
  "Bbc"
  (fn [] 
    (vim.cmd "ConjureConnect 1667"))
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
