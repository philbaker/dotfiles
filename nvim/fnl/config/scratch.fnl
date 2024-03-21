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
