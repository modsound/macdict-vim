let s:save_cpo = &cpo
set cpo&vim

" set program path
if executable(expand('<sfile>:p:h:h')."/autoload/dict")
  let s:macdict_prg = "r!".expand('<sfile>:p:h:h')."/autoload/dict "
else
  echo "Before using macdict-vim, You need compile dict.m in the plugin directory."
endif

" set window option
if !exists('g:macdict_window_size')
  let g:macdict_window_size = 'botright 8split'
endif

" consult mac internal dictionaries
function! macdict#s:consul(opt, arg)
  if !has("mac")
    echo "Sorry. macdict.vim is only for Mac OSX User."
    return
  endif
  let winnum = bufwinnr(bufnr('MacDictBuffer'))
  if winnum != -1
    if winnum != bufwinnr('%')
      silent exec ":normal \<C-w>".winnum."w"
    endif
  else
    silent exec g:macdict_window_size.' MacDictBuffer'
  endif
  silent exec ":normal ggdG"
  exec s:macdict_prg a:opt a:arg
  setlocal buftype=nofile wrap textwidth=0 noswapfile nonumber
  silent exec ":normal ggdd"
endfunction

" close output
function! macdict#s:close()
  silent exec ":bdelete MacDictBuffer"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
