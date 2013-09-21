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
