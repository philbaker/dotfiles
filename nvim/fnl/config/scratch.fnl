(comment
  (os.clock)
  (os.getenv "HOME")

  ; populate the quickfix list
  (vim.fn.setqflist {} " " {:lines (vim.fn.systemlist "ls -la")})
  (vim.fn.setqflist {} " " {:lines ["hello" "world"]})
  (vim.cmd.copen)
  (vim.cmd.cclose)
)
