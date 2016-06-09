" [ ] becomes [x], [x] becomes [ ], nothing gets [ ] at start
function! ToggleTodo()
  s/\[ \]/\[bbb\]/e
  s/\[x\]/\[ \]/e
  s/\[bbb\]/\[x\]/e
	s/^\(\s*\)\([^\[ ]\)/\1[ ] \2/e
endfunction
