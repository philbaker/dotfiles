(module config.helper)

(def ag-outside-cwd
  (fn 
    [dir args]
    "Runs Ag search outside of current directory"
    (let [current-dir (vim.fn.getcwd)]
      (do
        (vim.api.nvim_set_current_dir (.. (os.getenv "HOME") dir))
        (vim.cmd (.. ":AgRaw -u " args))
        (vim.api.nvim_set_current_dir current-dir)))))

(def split-string-by-line
  (fn 
    [str]
    "Splits a multiline string into an array of lines"
    (let [words []]
      (each [line (string.gmatch str "([^\n]*)\n?")]
        (if (not= (string.len line) 0)
          (table.insert words line)))
      words)))
