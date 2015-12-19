" Custom functions

" I sometime work on a project with 120 is the colum width,
" and most of the time I prefer the 80 column width.
" This function toggles the columwidth highlighting.
function! ColumnWidthToggle()
  if(&textwidth == 120)
    set textwidth=80
  else
    set textwidth=120
  endif
endfunc
set textwidth=80
set colorcolumn=+1

nnoremap <leader>ce :call ColumnWidthToggle()<cr>

:hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white
:hi CursorColumn cterm=NONE ctermbg=black ctermfg=white guibg=black guifg=white

" Toggle cursorline
function! CursorLineToggle()
  set cursorline!
endfunc

nnoremap <leader>cl :call CursorLineToggle()<cr>

" Toggle cursorcolumn
function! CursorColumnToggle()
  set cursorcolumn!
endfunc

nnoremap <leader>cc :call CursorColumnToggle()<cr>

" Toggle between relative line numbering and normal line numbering
function! LineNumToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>l :call LineNumToggle()<cr>
