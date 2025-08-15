[{1 :nvim-orgmode/orgmode
  :event "VeryLazy"
  :ft ["org"]
  :config (fn []
            (let [orgmode (require :orgmode)]
              (orgmode.setup {:org_agenda_files "~/org-sync/*"
                              :org_default_notes_file 
                              (if (= (. (vim.loop.os_uname) "sysname") "Darwin")
                                "~/org-sync/tasks.org"
                                "~/org-sync/laptop.org")
                              :org_todo_keywords ["REPEAT" "TODO" "NEXT" "ACTIVE" "WAITING" "SOMEDAY" "PROJ" "|" "DONE" "CANCELLED" "COMPLETED"]})))}]

