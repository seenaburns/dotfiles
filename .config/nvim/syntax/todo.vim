:so $VIMRUNTIME/syntax/markdown.vim

syntax match todoDONE "\v *\[x\].*"
syntax match todoCOMMENT "\v^ *[a-zA-Z0-9-].*"

hi link todoDONE comment
hi link todoCOMMENT comment
