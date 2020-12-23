" vim source for tailwind
function! coc#source#tw#init() abort
  return {
        \ 'priority': 1,
        \ 'shortcut': 'TW',
        \ 'triggerCharacters': ['^']
        \}
endfunction

function! coc#source#tw#complete(opt, cb) abort
	let items = ['.container', '.static', '.fixed', '.absolute', '.relative', '.sticky', '.inset-0', '.inset-x-0', '.inset-y-0', '.inset-x-auto', '.inset-y-auto', '.inset-auto', '.top-0', '.bottom-0', '.left-0', '.right-0', '.top-auto', '.bottom-auto', '.left-auto', '.right-auto', '.z-0', '.z-10', '.z-20', '.z-30', '.z-40', '.z-50', '.z-auto', '.flex', '.inline-flex', '.flex-row', '.flex-row-reverse', '.flex-col', '.flex-col-reverse', '.flex-no-wrap', '.flex-wrap', '.flex-wrap-reverse', '.items-stretch', '.items-start', '.items-center', '.items-end', '.items-baseline', '.content-start', '.content-center', '.content-end', '.content-between', '.content-around', '.self-auto', '.self-start', '.self-center', '.self-end', '.self-stretch', '.justify-start', '.justify-center', '.justify-end', '.justify-between', '.justify-around', '.flex-1', '.flex-auto', '.flex-initial', '.flex-none', '.flex-grow', '.flex-grow-0', '.flex-shrink', '.flex-shrink-0', '.order-first', '.order-last', '.order-none', '.order-', '.visible', '.invisible', '.hidden', '.block', '.inline-block', '.inline', '.table', '.table-row', '.table-cell', '.clearfix', '.float-left', '.float-right', '.float-none', '.object-contain', '.object-cover', '.object-fill', '.object-none', '.object-scale-down', '.object-bottom', '.object-center', '.object-left', '.object-left-bottom', '.object-left-top', '.object-right', '.object-right-bottom', '.object-right-top', '.object-top', '.w-', '.w-auto', '.w-px', '.w-full', '.w-screen', '.h-', '.h-auto', '.h-px', '.h-full', '.h-screen', '.max-w-xs', '.max-w-sm', '.max-w-md', '.max-w-lg', '.max-w-xl', '.max-w-2xl', '.max-w-3xl', '.max-w-4xl', '.max-w-5xl', '.max-w-6xl', '.max-w-full', '.max-h-full', '.max-h-screen', '.min-w-0', '.min-w-full', '.min-h-0', '.min-h-full', '.min-h-screen']

	let items2 = ['.overflow-auto', '.overflow-hidden', '.overflow-visible', '.overflow-scroll', '.overflow-x-auto', '.overflow-x-hidden', '.overflow-x-visible', '.overflow-x-scroll', '.overflow-y-auto', '.overflow-y-hidden', '.overflow-y-visible', '.overflow-y-scroll', '.scrolling-touch', '.scrolling-auto', '.font-sans', '.font-serif', '.font-mono', '.text-xs', '.text-sm', '.text-base', '.text-lg', '.text-xl', '.text-2xl', '.text-3xl', '.text-4xl', '.text-5xl', '.text-6xl', '.antialiased', '.subpixel-antialiased', '.italic', '.not-italic', '.font-hairline', '.font-thin', '.font-light', '.font-normal', '.font-medium', '.font-semibold', '.font-bold', '.font-extrabold', '.font-black', '.leading-none', '.leading-tight', '.leading-snug', '.leading-normal', '.leading-relaxed', '.leading-loose', '.tracking-tighter', '.tracking-tight', '.tracking-normal', '.tracking-wide', '.tracking-wider', '.tracking-widest', '.text-left', '.text-center', '.text-right', '.text-justify', '.text-transparent', '.text-black', '.text-white', '.text-gray-', '.text-red-', '.text-orange-', '.text-yellow-', '.text-green-', '.text-teal-', '.text-blue-', '.text-indigo-', '.text-purple-', '.text-pink-', '.placeholder-transparent', '.placeholder-black', '.placeholder-white', '.placeholder-gray-', '.placeholder-red-', '.placeholder-orange-', '.placeholder-yellow-', '.placeholder-green-', '.placeholder-teal-', '.placeholder-blue-', '.placeholder-indigo-', '.placeholder-purple-', '.placeholder-pink-', '.placeholder-left', '.placeholder-center', 'not-sr-only', 'fill-current', 'stroke-current']

	let items3 = ['.placeholder-right', '.placeholder-justify', '.underline', '.line-through', '.no-underline', '.uppercase', '.lowercase', '.capitalize', '.normal-case', '.break-normal', '.break-words', '.break-all', '.truncate', '.whitespace-normal', '.whitespace-no-wrap', '.whitespace-pre', '.whitespace-pre-line', '.whitespace-pre-wrap', '.align-baseline', '.align-top', '.align-middle', '.align-bottom', '.align-text-top', '.align-text-bottom', '.list-none', '.list-disc', '.list-decimal', '.list-inside', '.list-outside', '.bg-fixed', '.bg-local', '.bg-scroll', '.bg-transparent', '.bg-black', '.bg-white', '.bg-gray-', '.bg-red-', '.bg-orange-', '.bg-yellow-', '.bg-green-', '.bg-teal-', '.bg-blue-', '.bg-indigo-', '.bg-purple-', '.bg-pink-', '.bg-bottom', '.bg-center', '.bg-left', '.bg-left-bottom', '.bg-left-top', '.bg-right', '.bg-right-bottom', '.bg-right-top', '.bg-top', '.bg-repeat', '.bg-no-repeat', '.bg-repeat-x', '.bg-repeat-y', '.bg-repeat-round', '.bg-repeat-space', '.bg-auto', '.bg-cover', '.bg-contain', '.border', '.border-0', '.border-2', '.border-4', '.border-8', '.border-t', '.border-t-', '.border-b', '.border-b-', '.border-l', '.border-l-', '.border-r', '.border-r-', '.border-collapse', '.border-separate', '.border-transparent', '.border-black', '.border-white', '.border-gray-', '.border-red-', '.border-orange-', '.border-yellow-', '.border-green-', '.border-teal-', '.border-blue-', '.border-indigo-', 'border-purple-', 'border-pink-', 'border-solid', 'border-dashed', 'border-dotted', 'border-double', 'border-none', 'rounded-', 'rounded-sm', 'rounded', 'rounded-lg', 'rounded-full', 'rounded-t-none', 'rounded-t-sm', 'rounded-t', 'rounded-t-', 'rounded-b-none', 'rounded-b', 'rounded-b-', 'rounded-l', 'rounded-l-', 'rounded-r-', 'rounded-r', 'rounded-tl-', 'rounded-tl', 'rounded-tr-', 'rounded-tr', 'rounded-bl-', 'rounded-bl', 'rounded-br-', 'rounded-br', 'shadow', 'shadow-md', 'shadow-lg', 'shadow-xl', 'shadow-2xl', 'shadow-inner', 'shadow-outline', 'shadow-none', 'outline-none', 'opacity-0', 'opacity-25', 'opacity-50', 'opacity-75', 'opacity-100', 'table-auto', 'table-fixed', 'appearance-none', 'cursor-auto', 'cursor-default', 'cursor-pointer', 'cursor-wait', 'cursor-move', 'cursor-not-allowed', 'pointer-events-none', 'pointer-events-auto', 'resize-none', 'resize', 'resize-x', 'resize-y', 'select-none', 'select-text', 'select-all', 'select-auto', 'sr-only']

	  call a:cb(items + items2 + items3)
	endfunction

	function! coc#source#tw#on_complete(item) abort
	  let save_pos = getpos('.')
	  :s/\^//
	  call setpos('.', save_pos)
	endfunction
