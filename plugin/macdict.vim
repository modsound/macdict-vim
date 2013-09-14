" PluginName: macdict-vim
" Maintener:  modsound
" Email:      modsound@gmail.com
" Twitter:    @modsound
" License:    MIT

" initial load
if exists('g:loaded_macdict_vim')
  finish
endif
let g:loaded_macdict_vim = 1

let s:save_cpo = &cpo
set cpo&vim

if !has("mac")
  echo "Sorry. macdict.vim is only for Mac OSX User."
  finish
endif

" set program path
if executable(expand('<sfile>:p:h:h')."/autoload/dict")
  let s:macdict_prg = "r!" . expand('<sfile>:p:h:h') . "/autoload/dict "
else
  echo "Before using macdict-vim, You need compile dict.m in the plugin directory."
endif

" set option
if !exists('g:macdict_window_size')
  let g:macdict_window_size = 'botright 8new'
endif

" consult mac internal dictionaries
function! macdict#s:consul(opt, arg)
  exec g:macdict_window_size
  exec s:macdict_prg a:opt a:arg
  setlocal buftype=nofile
  setlocal textwidth=0
  setlocal wrap
  setlocal noswapfile
  setlocal nonumber
  exec ":normal gg"
  setlocal nomodifiable
endfunction

" close output
function! macdict#s:close()
  exe ":bdelete"
endfunction

" define command
command! -nargs=1 MacDict call macdict#s:consul('', <q-args>)
command! -nargs=1 MacDictJapan call macdict#s:consul('-j', <q-args>)
command! -nargs=1 MacDictEnglish call macdict#s:consul('-e', <q-args>)
command! -nargs=1 MacDictThesaurus call macdict#s:consul('-t', <q-args>)
command! -nargs=1 MacDictGerman call macdict#s:consul('-g', <q-args>)
command! -nargs=1 MacDictFrench call macdict#s:consul('-f', <q-args>)
" command! -nargs=1 MacDictApple call macdict#s:consul('-a', <q-args>)
" command! -nargs=1 MacDictWikipedia call macdict#s:consul('-w', <q-args>)
command! -nargs=0 MacDictCWord call macdict#s:consul('', expand('<cword>'))
command! MacDictClose call macdict#s:close()

let &cpo = s:save_cpo
unlet s:save_cpo
