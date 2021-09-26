# Vim tips
- `:wall` write all files in the argslist (rather than step through individually)

## Window management
- `<C-w>w - Cycle between open winows
- `:on[ly]` - `<C-w>o` - Keep only the active window, closing all others
- `<C-w>=` - Equalize width and height of all windows
- `<C-w>_` Maximise height of the active window
- `<C-w>|` Maximise width of the active window
- `:h window-moving`

## Tabs
- `:tabe {filename}` - Open {filename in a new tab}
- <C-w>T - Move the current window into its own tab
- `:tabc` - Close the current tab page and all of its windows
- `:tabo` - Keep the active tab page, closing all others
- `:tabn {N}` - `{N}gt` - Switch to tab page number {N}
- `:tabn` - `gt` - switch to next tab page
- `tabp` - `gT` - Switch to the previous tab page
- `tabm {N} - Rearrange tabs. If {N} is ommitted it moves tab to the end

# Tmux tips
- `<C-b>>` - Show menu to swap or split windows
