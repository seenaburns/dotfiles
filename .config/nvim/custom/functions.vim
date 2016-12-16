" [ ] becomes [x], [x] becomes [ ], nothing gets [ ] at start
function! ToggleTodo()
  s/\[ \]/\[bbb\]/e
  s/\[x\]/\[ \]/e
  s/\[bbb\]/\[x\]/e
	s/^\(\s*\)\([^\[ ]\)/\1[ ] \2/e
endfunction

" Quickfix Toggle
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
