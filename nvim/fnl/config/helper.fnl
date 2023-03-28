(module config.helper)

(defn ag-outside-cwd 
  [dir args]
  "Runs Ag search outside of current directory"
  (let [current-dir (vim.fn.getcwd)]
    (do
      (vim.api.nvim_set_current_dir (.. (os.getenv "HOME") dir))
      (vim.cmd (.. ":AgRaw -u " args))
      (vim.api.nvim_set_current_dir current-dir))))

(defn split-string-by-line
  [str]
  "Splits a multiline string into an array of lines"
  (let [words []]
    (each [line (string.gmatch str "([^\n]*)\n?")]
      (if (not= (string.len line) 0)
        (table.insert words line)))
    words))

(defn remove-all-spaces
  [str]
  "Removes all spaces from string"
  (tostring (string.gsub str "%s+" "")))

(defn nbb-script
  [script args]
  "Calls external nbb scripts"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (remove-all-spaces 
      (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args)))))

(defn nbb-script-spaces
  [script args]
  "Calls external nbb scripts"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args))))

(defn replace-pixel-rem
  []
  "Replaces pixel value with rem in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "pixel_to_rem" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(defn replace-rem-pixel
  []
  "Replaces rem value with pixel in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "rem_to_pixel" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(defn replace-hex-rgb
  []
  "Replaces hex colour value with rgb in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "hex_to_rgb" (.. "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diwi" replacement))))

(defn system-os
  []
  "Returns Linux or Darwin"
  (. (vim.loop.os_uname) "sysname"))

(defn insert-optimised-svg
  [file-name id]
  (vim.api.nvim_buf_set_lines 0 -1 -1 false 
                              (split-string-by-line 
                                (if id
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name id))
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name))))))
