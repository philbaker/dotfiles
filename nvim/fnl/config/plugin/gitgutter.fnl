(module config.plugin.gitgutter
  {autoload {nvim aniseed.nvim}})

(nvim.ex.let "g:gitgutter_map_keys = 0")
(nvim.set_keymap :n :<leader>ghp "<Plug>(GitGutterPreviewHunk)" {:noremap true})
(nvim.set_keymap :n :<leader>ghu "<Plug>(GitGutterUndoHunk)" {:noremap true})
(nvim.set_keymap :n :<leader>ghs "<Plug>(GitGuttonStageHunk)" {:noremap true})
(nvim.set_keymap :x :<leader>ghs "<Plug>(GitGutterStageHunk)" {:noremap true})
