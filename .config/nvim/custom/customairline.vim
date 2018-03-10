let s:guibg = 'none'
let s:guifg = '#ffffff'
let s:termbg = 'green'
let s:termbg_inactive = 'none'
let s:termbg_warning = 'red'
let s:termfg = 'white'
let s:termfg_inactive = 'black'
let s:termfg_modified = 'green'

" Visual mode
let s:V1 = [s:guibg,s:guifg,s:termfg,s:termbg]
let s:V2 = [s:guibg,s:guifg,s:termfg,s:termbg]
let s:V3 = [s:guibg,s:guifg,s:termfg,s:termbg]

" Replace mode
let s:R1 = [s:guibg,s:guifg,s:termfg,s:termbg]
let s:R2 = [s:guibg,s:guifg,s:termfg,s:termbg]
let s:R3 = [s:guibg,s:guifg,s:termfg,s:termbg]

let g:airline#themes#customairline#palette = {}


function! customairline#refresh()

  let s:StatusLine = airline#themes#get_highlight('StatusLine')
  let s:StatusLineNC = airline#themes#get_highlight('StatusLineNC')

  " Insert mode
  let s:I1 = [s:guibg,s:guifg,s:termfg,s:termbg]
  let s:I2 = [s:guibg,s:guifg,s:termfg,s:termbg]
  let s:I3 = [s:guibg,s:guifg,s:termfg,s:termbg]

  " Normal mode
  let s:N1 = [s:guibg,s:guifg,s:termfg,s:termbg]
  let s:N2 = [s:guibg,s:guifg,s:termfg,s:termbg]
  let s:N3 = [s:guibg,s:guifg,s:termfg,s:termbg]

  let s:N1 = [s:guibg,s:guifg,s:termfg,s:termbg]

  " Tabline Plugin
  let g:airline#themes#customairline#palette.tabline = {
        \ 'airline_tab':            [s:guibg,s:guifg,s:termfg_inactive,s:termbg_inactive],
        \ 'airline_tabsel':         [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tab_right':      [s:guibg,s:guifg,s:termfg_inactive,s:termbg_inactive],
        \ 'airline_tabsel_right':   [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tabmod_right':   [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tabtype':        [s:guibg,s:guifg,s:termfg_inactive,s:termbg_inactive],
        \ 'airline_tabfill':        [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tabhid':         [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tabmod':         [s:guibg,s:guifg,s:termfg,s:termbg_inactive],
        \ 'airline_tabmod_unsel':   [s:guibg,s:guifg,s:termfg_inactive,s:termbg_inactive]
        \ }

  let g:airline#themes#customairline#palette.normal = airline#themes#generate_color_map(s:N1,s:N2,s:N3)
  let g:airline#themes#customairline#palette.visual = airline#themes#generate_color_map(s:V1,s:V2,s:V3)
  let g:airline#themes#customairline#palette.insert = airline#themes#generate_color_map(s:I1,s:I2,s:I3)
  let g:airline#themes#customairline#palette.replace = airline#themes#generate_color_map(s:R1,s:R2,s:R3)

  let g:airline#themes#customairline#palette.normal_modified = {
        \ 'airline_a':  [s:guibg,s:guifg,s:termfg_modified,s:termbg],
        \ }
  let g:airline#themes#customairline#palette.insert_modified = g:airline#themes#customairline#palette.normal_modified
  let g:airline#themes#customairline#palette.visual_modified = g:airline#themes#customairline#palette.normal_modified
  let g:airline#themes#customairline#palette.replace_modified = g:airline#themes#customairline#palette.normal_modified

  " Warning
  let g:airline#themes#customairline#palette.normal.airline_warning = [s:guibg,s:guifg,s:termfg,s:termbg_warning]

  " Inactive Mode
  let s:IA = [s:guibg,s:guifg,s:termfg_inactive,s:termbg_inactive]
  let g:airline#themes#customairline#palette.inactive = airline#themes#generate_color_map(s:IA,s:IA,s:IA)
  let g:airline#themes#customairline#palette.inactive_modified = {
        \ 'airline_c':  [s:guibg,s:guifg,s:termfg_modified,s:termbg_inactive],
        \ }

endfunction

call customairline#refresh()

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#customairline#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#d7d7ff' , '#5f00af' , 189 , 'none'  , ''     ],
      \ [ '#ffffff' , '#875fd7' , 231 , 'none'  , ''     ],
      \ [ '#5f00af' , '#ffffff' , 55  , 'none' , 'bold' ])
