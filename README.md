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
-> Search an argument word with Japanese-English dictionary.
```

```
:MacDictCWord
-> Search the word under the cursor with Japanese-English dictionary.
```

```
:MacDictEnglish
-> Search an argument word with American English Dictionary.
```

```
:MacDictThesaurus
-> Search an argument word with American English Thesaurus dictionary.
```

```
:MacDictWikipedia
-> Search an argument word with Wikipedia.
```

```
:MacDictApple
-> Search an argument word with Apple Dictionary.
```

```
:MacDictFrench
-> Search an argument word with French Dictionary.
```

```
:MacDictGerman
-> Search an argument word with German Dictionary.
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
