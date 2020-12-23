" vim source for emails
function! coc#source#email#init() abort
  return {
        \ 'priority': 9,
        \ 'shortcut': 'Email',
        \ 'triggerCharacters': ['']
        \}
endfunction

function! coc#source#email#complete(opt, cb) abort
  let items = ['.foogmailcom', '.baryahoocom']
  call a:cb(items)
endfunction
