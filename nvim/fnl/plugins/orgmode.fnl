[{1 :nvim-orgmode/orgmode
  :event "VeryLazy"
  :ft ["org"]
  :config (fn []
            (let [orgmode (require :orgmode)]
              (orgmode.setup {:org_agenda_files "~/orgfiles/*"
                              :org_default_notes_file "~/orgfiles/tasks.org"
                              :org_todo_keywords ["REPEAT" "TODO" "NEXT" "ACTIVE" "WAITING" "SOMEDAY" "PROJ" "|" "DONE" "CANCELLED" "COMPLETED"]})))}]

