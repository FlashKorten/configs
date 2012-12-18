if exists("misc_after_haskell")
    finish
endif
let misc_after_haskell = 1

setlocal omnifunc=necoghc#omnifunc

function! OpenHaskellFile()
  let f = tr(matchstr(getline(line('.')), '\(import\s*qualified\|import\)\s*\zs[A-Za-z0-9.]\+'), ".", "/") . ".hs"
  if f == ".hs"
     echohl ErrorMsg
     echo "Not on a valid import line!"
     echohl NONE
     return
  endif
  if filereadable(f)
     if (&modified)
       echohl ErrorMsg
       echo "Current buffer is modified, save it first!"
       echohl NONE
     else
       execute ':e ' . f
     endif
  else
     echohl ErrorMsg
     echo "Can't find file \"" . f . "\" in path"
     echohl NONE
  endif
endfunction

nnoremap <silent> ghf :call OpenHaskellFile()<CR>
nnoremap <leader>h :Hoogle 
nnoremap <silent><leader>H :HoogleClose<CR>

let g:syntastic_haskell_checker_args =
  \ '--hlintOpt="--ignore=Use import/export shortcut" --ghcOpt="-fno-warn-name-shadowing"'

if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif
nnoremap <F6> :TagbarToggle<CR>

"let g:no_haskell_conceal = 1
