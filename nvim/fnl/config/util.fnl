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

(fn system-os []
  "Returns Linux or Darwin"
  (. (vim.loop.os_uname) "sysname"))

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

(fn call-script! [command script args]
  "Calls external node script"
  (let [scripts-dir (.. (os.getenv "HOME") "/dotfiles/scripts/")]
    (vim.fn.system (.. command " " scripts-dir script args))))

(fn tailwind-color [arg color]
  (remove-all-spaces 
    (call-script! 
      "node" 
      "tw-colors/index.mjs" 
      (.. " " arg " " "\"" (tostring color) "\""))))

(fn pixel->rem [val]
  (/ val 16))

(fn rem->pixel [val]
  (* val 16))

(fn hex->rgb [val]
  (remove-all-spaces 
    (call-script! 
      "nbb" 
      "nbbs/hex_to_rgb.cljs" 
      (.. " " "\"" (tostring val) "\""))))

(fn rgb->hex [val]
  (remove-all-spaces 
    (call-script! 
      "nbb" 
      "nbbs/rgb_to_hex.cljs" 
      (.. " " "\"" (tostring val) "\""))))

{: split-string-by-line
 : remove-all-spaces
 : call-script!
 : system-os
 : set-uc
 : set-key
 : getcwf
 : cmdtc
 : tailwind-color
 : pixel->rem
 : rem->pixel
 : rgb->hex
 : hex->rgb}
