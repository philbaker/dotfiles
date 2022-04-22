(module config.plugin.vimux
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :v :<leader>vs ":call VimuxRunCommand(@v)<CR>" {:noremap true})
