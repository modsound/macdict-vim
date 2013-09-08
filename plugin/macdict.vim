let s:save_cpo = &cpo
set cpo&vim

" set program path
let s:macdict_prg = "r!" . expand('<sfile>:p:h:h') . "/autoload/dict "

" set option
if !exists('g:macdict_window_size')
  let g:macdict_window_size = '30vsplit'
endif

" consult mac internal dictionaries
function! macdict#s:consul(opt, arg)
  exec ":" . g:macdict_window_size . "+enew"
  exec s:macdict_prg a:opt a:arg
  setlocal readonly
  setlocal nomodifiable
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal nonumber
  setlocal norelativenumber
  exec ":normal gg"
endfunction

" close output
function! macdict#s:close()
  bd!
endfunction

" define command
command! -nargs=1 MacDict call macdict#s:consul('', <q-args>)
command! -nargs=1 MacDictEng call macdict#s:consul('-e', <q-args>)
command! -nargs=1 MacDictDaijirin call macdict#s:consul('-j', <q-args>)
command! -nargs=1 MacDictRuigo call macdict#s:consul('-s', <q-args>)
command! -nargs=0 MacDictCWord call macdict#s:consul('', expand('<cword>'))
command! MacDictClose call s:close()

let &cpo = s:save_cpo
unlet s:save_cpo
