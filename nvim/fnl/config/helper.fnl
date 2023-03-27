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

(def remove-all-spaces
  (fn
    [str]
    "Removes all spaces from string"
    (tostring (string.gsub str "%s+" ""))))

(def nbb-script
  (fn
    [script args]
    (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
      (remove-all-spaces 
        (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args))))))

(def replace-pixel-rem
  (fn
    []
    (let [current-word (vim.call "expand" "<cword>")
          replacement (nbb-script "pixel_to_rem" (tostring current-word)) ]
      (vim.cmd (.. "normal! diwi" replacement)))))

(def replace-rem-pixel
  (fn
    []
    (let [current-word (vim.call "expand" "<cword>")
          replacement (nbb-script "rem_to_pixel" (tostring current-word)) ]
      (vim.cmd (.. "normal! diwi" replacement)))))
