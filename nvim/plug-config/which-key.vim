" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['.'] = [ ':e $MYVIMRC', 'edit init']
let g:which_key_map[','] = [ ':source $MYVIMRC', 'reload init']
let g:which_key_map['f'] = [ ':Files', 'search files' ]

" e is for explorer
let g:which_key_map.e = {
  \ 'name' : '+explorer',
  \ 'e' : [ ':CocCommand explorer'                     , 'explorer drawer'   ],
  \ 'f' : [ ':CocCommand explorer --position floating' , 'explorer floating' ]
  \ }

" s is for search
let g:which_key_map.s = {
  \ 'name' : '+search',
  \ 'f' : [ ':Files'    , 'search files'   ],
  \ 'b' : [ ':Buffers'  , 'search buffers' ]
  \ }

" t is for tabs
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tf :tabnew<cr>:Files<cr>
nnoremap <silent> <leader>tb :tabnew<cr>:Buffers<cr>
nnoremap <silent> <leader>te :tabnew<cr>:CocCommand explorer --position floating<cr>
let g:which_key_map.t = {
  \ 'name' : '+tabs',
  \ 'n' : 'new tab',
  \ 'f' : 'new tab files',
  \ 'b' : 'new tab buffers',
  \ 'e' : 'new tab explorer'
  \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")
