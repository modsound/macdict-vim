macdict-vim
===========

You can consult dictionaries from Vim for Mac OSX with this plugin.
But this plugin uses Mac OSX internal dictionaries.

## INSTALL
```
NeoBundle 'modsound/macdict-vim.git'
```

## COMPILE
```
$ cd ~/.vim/bundle/macdict.vim/autoload/
```
```
$ make
```

## PROVIDED COMMAND

```
:MacDict
-> Search an argument word.
```

```
:MacDictCWord
-> Search the word under the cursor.
```

```
:MacDictDaijirin
-> Search an argument word with Daijirin(Japanese Dictionary).
```

```
:MacDictEng
-> Search an argument word with English-English Dictionary.
```

```
:MacDictRuigo
-> Search an argument word with RuigoJiten(Japanese Thesaurus Dictionary).
```

```
:MacDictClose
-> Close output buffer.
```

## CONFIG
You can change layout and size through global variable in your .vimrc.
```
let g:macdict_window_size = '30vsplit'
```
