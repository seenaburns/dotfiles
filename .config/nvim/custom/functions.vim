" [ ] becomes [x], [x] becomes [ ], nothing gets [ ] at start
function! ToggleTodo()
  s/\[ \]/\[bbb\]/e
  s/\[x\]/\[ \]/e
  s/\[bbb\]/\[x\]/e
	s/^\(\s*\)\([^\[ ]\)/\1[ ] \2/e
endfunction

function! ToggleTodoToday()
  s/\([^ ][^\*]\)$/\1 bbb/e
  s/ \*$//e
  s/bbb$/*/e
endfunction

" CopyMode
function! CopyModeToggle()
  if &number
    set nonumber
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction

" Clear whitespace at end of line
function! ClearExtraWhitespace()
  %s/  *$//gc
endfunction
