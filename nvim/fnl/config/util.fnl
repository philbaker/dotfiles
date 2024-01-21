(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(fn split-string-by-line [str]
  "Splits a multiline string into an array of lines"
  (let [words []]
    (each [line (string.gmatch str "([^\n]*)\n?")]
      (if (not= (string.len line) 0)
        (table.insert words line)))
    words))

(fn remove-all-spaces [str]
  "Removes all spaces from string"
  (tostring (string.gsub str "%s+" "")))

(fn nbb-script [script args]
  "Calls external nbb script"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (remove-all-spaces
      (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args)))))

(fn nbb-script-spaces [script args]
  "Calls external nbb scripts"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/nbbs/")]
    (vim.fn.system (.. "nbb " scripts-dir script ".cljs " args))))

(fn node-script [script args]
  "Calls external node script"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/")]
    (remove-all-spaces
      (vim.fn.system (.. "node " scripts-dir script args)))))

(fn replace-pixel-rem []
  "Replaces pixel value with rem in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "pixel_to_rem" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-rem-pixel []
  "Replaces rem value with pixel in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "rem_to_pixel" (tostring current-word)) ]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-hex-rgb []
  "Replaces hex colour value with rgb in place"
  (let [current-word (vim.call "expand" "<cword>")
        replacement (nbb-script "hex_to_rgb" (.. "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diwi" replacement))))

(fn replace-rgb-hex []
  "Replaces rgb colour value with hex in place"
  (let [current-word (vim.call "expand" "<cWORD>")
        replacement (nbb-script "rgb_to_hex" (.. "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diWi" replacement))))

(fn tailwind-colors [arg]
  (let [current-word (vim.call "expand" "<cWORD>")
        replacement (node-script "tw-colors/index.mjs" (.. " " arg " " "\"" (tostring current-word) "\""))]
    (vim.cmd (.. "normal! diWi" replacement))))

(fn tailwind-class-to-hex []
  "Replaces a Tailwind class name with its hex value"
  (tailwind-colors "ch"))

(fn tailwind-hex-to-class []
  "Replaces a hex value with its Tailwind class name"
  (tailwind-colors "hc"))

(fn system-os []
  "Returns Linux or Darwin"
  (. (vim.loop.os_uname) "sysname"))

(fn insert-optimised-svg [file-name id]
  (vim.api.nvim_buf_set_lines 0 -1 -1 false 
                              (split-string-by-line 
                                (if id
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name id))
                                  (nbb-script-spaces "svg_to_symbol" (.. (os.getenv "HOME") "/Downloads/" file-name))))))

(fn set-key [key action noremap ?mode]
  (nvim.set_keymap (or ?mode :n) key action {:noremap noremap}))

(fn set-uc [name command ?opts]
  (vim.api.nvim_create_user_command
    name
    command
    (or ?opts {:bang false})))

(fn getcwf []
  "Returns abbreviated current working directory"
  (tostring
    (string.gsub
      (vim.fn.getcwd)
      (os.getenv "HOME")
      "")))

(fn cmdtc [cmd]
  "A shorter version of nvim_replace_termcodes"
  (vim.cmd (vim.api.nvim_replace_termcodes (.. "normal " cmd) true true true)))

{: split-string-by-line
 : remove-all-spaces
 : nbb-script
 : nbb-script-spaces
 : node-script
 : replace-pixel-rem
 : replace-rem-pixel
 : replace-hex-rgb
 : replace-rgb-hex
 : tailwind-colors
 : tailwind-class-to-hex
 : tailwind-hex-to-class
 : insert-optimised-svg
 : system-os
 : set-uc
 : set-key
 : getcwf
 : cmdtc}
