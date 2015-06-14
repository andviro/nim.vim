if exists("b:nim_loaded")
  finish
endif

let b:nim_loaded = 1

if !exists('g:nim_jump_to_error')
    let g:nim_jump_to_error = 1
endif

let s:cpo_save = &cpo
set cpo&vim

call nim#init()

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:##,:#
setlocal commentstring=#\ %s
setlocal omnifunc=NimComplete
setlocal suffixesadd=.nim 
setlocal expandtab  "Make sure that only spaces are used

compiler nim
nnoremap <silent> <leader>b :<C-u>call nim#Build(!g:nim_jump_to_error,'')<CR>

let &cpo = s:cpo_save
unlet s:cpo_save

