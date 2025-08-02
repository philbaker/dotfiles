(if (= (. (vim.loop.os_uname) "sysname") "Darwin")
  [{1 "github/copilot.vim"
    :event "InsertEnter"
    :config (fn []
              (vim.keymap.set "i" "<C-J>" "copilot#Accept(\"\\<CR>\")"
                              {:expr true
                               :replace_keycodes false})
              (set vim.g.copilot_no_tab_map true))}]
  [])
