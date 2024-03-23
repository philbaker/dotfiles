(local {: autoload} (require :nfnl.module))
(local util (autoload :config.util))

; Basic fennel
(comment
  (os.clock) 
  ; 7.342779

  (os.getenv "HOME") 
  ; "/home/user"

  (vim.print "hello") 
  ; "hello"

  (vim.fn.getline 11) 
  ; "  (vim.fn.getline 11)"

  (vim.cmd (vim.fn.input "echo hi"))

  ; populate the quickfix list
  (vim.fn.setqflist {} " " {:lines (vim.fn.systemlist "ls -la")})
  (vim.fn.setqflist {} " " {:lines ["hello" "world"]})
  (vim.cmd.copen)
  (vim.cmd.cclose)
)

; Tailwind colors
(comment
  ; class to hex
  (util.tailwind-color "ch" "red-100")
  ; "#fee2e2"

  ; class to rgb
  (util.tailwind-color "cr" "red-100")
  ; "rgb(254,226,226)"

  ; hex to class
  (util.tailwind-color "hc" "#fee2e2")
  ; "red-100"

  ; rgb to class
  (util.tailwind-color "rc" "rgb(254, 226, 226)")
  ; "red-100"
  )
