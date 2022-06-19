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
