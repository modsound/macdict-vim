let s:save_cpo = &cpo
set cpo&vim

" set program path
if executable(expand('<sfile>:p:h:h')."/autoload/dict")
  let s:macdict_prg = "r!" . expand('<sfile>:p:h:h') . "/autoload/dict "
else
  echo "Before using macdict-vim, You need compile dict.m in the plugin directory."
endif

" set window option
if !exists('g:macdict_window_size')
  let g:macdict_window_size = 'botright 8new'
endif

" consult mac internal dictionaries
function! macdict#s:consul(opt, arg)
  exec g:macdict_window_size
  exec s:macdict_prg a:opt a:arg
  setlocal buftype=nofile
  setlocal filetype=MacDictBuffer
  setlocal wrap textwidth=0 noswapfile nonumber
  silent exec ":normal gg"
  silent exec ":normal dd"
  setlocal nomodifiable
endfunction

" close output
function! macdict#s:close()
  if (&filetype=='MacDictBuffer')
    silent exec ":bdelete"
  else
    echo "This is not MacDictBuffer."
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
