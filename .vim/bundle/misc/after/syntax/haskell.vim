if exists("misc_after_haskell")
    finish
endif
let misc_after_haskell = 1

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

:map <silent> ghf :call OpenHaskellFile()<CR>
nnoremap <F6> :TagbarToggle<CR>
source /home/haskell/git-projects/lushtags/plugin/tagbar-haskell.vim
"let g:no_haskell_conceal = 1
