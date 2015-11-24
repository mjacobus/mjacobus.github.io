---
layout: post
title: Using VIM as a PHP IDE
tags: [Vim, PHP]
---

EDIT: you can watch a video based on this post [here](/2015/09/30/vim-as-a-php-developer-video-presentation.html)

On this post I will try to share my vim adventure for the last 2 years. I've
been using only VIM developing for about 2 years now. On this post I will try
to explain why I chose VIM and how I use it for writing code, mostly PHP.

I will update this post as I have the time.

## Why VIM?

By the time I started doing ruby development my favorite IDE (Netbeans) was
discontinuing its support to that. Then I would either have to pay for rubymine
or just use a editor. I started using Sublime text and it was kind of fine, although
it was not very easy to keep my config synced at home and at work.

Then I realized that many ruby developers actually use VIM. I thought it was because
ruby devs like to show off =)

Well, after seeing some videos of people using VIM, like [this video](https://www.youtube.com/watch?v=SkdrYWhh-8s),
for example, I realized that people can be very productive in VIM.

Some people like [Matthew Weier O'Phinney](https://mwop.net/blog/164-Vim-Productivity-Tips-for-PHP-Developers.html),
the lead dev and top committer of Zend Framework, or [Aaron Patterson](https://github.com/tenderlove), top 2 rails committers,
actually have been using VIM for over 10 years as "IDE". Turns out that most of Rails code was written on it.
Same goes for Zend. Well, they are either too stupid, or VIM can actually be more convenient than many would expect.

Facts I had already known about VIM:

- VIM has been around for a long time
- It is terminal based (I love the command live interface. And the longest I can stay there, the better)
- Fast
- Available on your ssh cowboy coding!
- You can dismiss your mouse
- Available in every system

Facts I learned over time:

- It is very clean and code focused
- Powerful
- Highly extensible
- Highly customizable
- Configuration can be versioned in a public repository such as github giving
  you the ability to have the very same configuration in every single computer
  you use VIM (workstation, laptop, PC) (see my configuration [here](https://github.com/mjacobus/.dotfiles))
- Once you are comfortable using VIM you can be very productive.
- Awesome for remote pair programming with tmux
- And plus you get to be cool =)

## Getting started with VIM

First thing you should keep in mind is that you will hate vim. Trust me, you
will. It can be very frustrating. But if you stick to it you will love it! I promise you.

Take typing for example. If you are a programmer, you probably know how to type
properly (if you don't, stop everything you are doing right now and learn
that!).

Remember the time you had managed to type fairly fast with what, 3 fingers? You
felt very proud and felt like you were flying on the keyboard. But sometimes
you typed 10 words or so just to realize that you were not even focused on the
editor and all the words you typed were send to nowhere. And you did that because
you weren't focused on the screen but on the keyboard.

Then you decided to learn how to type properly. It took some time, discipline
and effort to learn that, right? You probably felt kind of retarded missing
keystrokes all the time and the backspace was probably the most stroked key.
But now you know how to type properly and you don't even have to look at your
keyboard. You don't even have to think. You fly on the keyboard and the words
magically appear on the screen.

Interestingly, if someone ask you where is the letter G, you will probably look
at the keyboard and search for that, or try to remember it. But if you are
asked to type a word with G, you do not have to look for that key at all. Why?
Because the G position is not really stored on your memory, but in your
[Muscle Memory](http://en.wikipedia.org/wiki/Muscle_memory). Your muscles
memorized more than 60 chars and more several function keys.

Didn't the effort pay off? It most certainly did!

A great deal of your VIM knowledge will live in your muscle memory. Your
fingers will just do what you want. Very fast. If you try to understand and
explain to someone what you did you will first have to figure out what your
hands did and then you can express it in words.

So, don't give up! Just as typing, it takes effort, but it will pay off!

### Ground rules for learning VIM

- Stop using the mouse. Use`h` (left) `j`(down) `k`(up) `l`(right) (disable arrow keys)
- Be patient

To prevent you from using the arrow keys to the following to you ~/.vimrc:

{% highlight vim %}
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>
{% endhighlight %}

## Vim has modes

[Vim has modes](http://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes)

- Normal mode
- Insert mode
- Visual mode
- Command line mode

Most part of the time when you are working on a test you are not actually
inserting text, but you are editing test. This is why when you start VIM you
are in ```normal``` mode. Therefore when you want to insert text you must enter
this very special "insert mode". You have many ways of doing that and the
easiest way is by typing ```i```, and then you can start inserting text where
your cursor is.

- ```a``` - enter insert mode **a**fter the cursor.
- ```A``` - enter insert mode at the end of the line. Think of it as "**A**ppend text to line".
- ```O``` - create a line before the current line and then you are in insert mode.
- ```o``` - you create a line after the current line and then you are in insert mode.
- ```S``` - deletes line and enter insert mode. Think of "**S**ubstitute line"
- ```s``` - deletes char under cursor and enter insert mode. Think of "**S**ubstitute char and enter insert mode"

To come back to normal mode you need to press ```<esc>```.

### Moving around

The above keys help you to move around You can move around when you are in normal mode by typing the following:

- `h` - move cursor left
- `j` - move cursor down
- `k` - move cursor up
- `l` - move cursor right
- `w` - move cursor to the beginning of the next `word`*
- `W` - move cursor to the beginning of the next `WORD`*
- `b` - move cursor to the beginning of the previous `word`*
- `B` - move cursor to the beginning of the previous `WORD`*
- `e` - move cursor to the end of the next `word`*
- `E` - move cursor to the end of the next `WORD`*
- `ge` - move cursor back to the end of the next `word`*
- `gE` - move cursor back to the end of the next `WORD`*

A `word` is any set of char that belong together (sorry, this is the best definition I came out so far).

A `WORD`, on the other hand, according to the `:help motion.txt` is:

    "... a sequence of non-blank characters, separated with white
    space. An empty line is also considered to be a WORD."

Take for example the string `127.0.0.1`. It is a single `WORD` string, but 7 `words`.


### Some nice commands

Some commands will act on either a selection or a movement. Movements are the things explained above.

You can change text by selecting a text and typing ```c``` or by typing ```c``` and choosing a movement.

- ```cw``` - **c**hange **w**ord from cursor on
- ```cW``` - **c**hange **W**ord from cursor on
- ```ciw``` - **c**hange **i**nside word
- ```ci"``` - **c**hange **i**nside double quotes
- ```ci{``` - **c**hange **i**nside { opening and closing brackets }
- ```ct"``` - **c**hange un**t**til the double quotes
- ```cf"``` - **c**hange un**t**til the double quotes, including double quotes


You can delete text by selecting a text and typing ```d``` or by typing ```d``` and choosing a movement.

- ```dap``` - **d**elete **a**round paragraph (block of text)
- ```di"``` - **d**elete **i**nside double quotes
- ```da"``` - **d**elete **a**round double quotes

There is probably much more, that I either dont remember or did not learn yet.

- ```gf``` - **g**go to **f**ile
- ```<ctrl>i``` - **g**go to **f**ile
- ```<ctrl>]``` - **g**go to definition (jumps to method definition, use ctags)

### Autocomplete

- ```<ctrl>x <ctrl>[completion type]```

Where:

- ```f``` - file completion (from the filesystem)
- ```o``` - omni completion
- ```n``` - keyword inside open buffer
- ```k``` - dictionary completion
- ```l``` - line completion

When the list opens, use ```<ctrl>n``` to **n**ext and ```<ctrl>p``` for previous

EDIT: Please refer to [this post](/2015/11/24/vim-autocompletion-for-php.html) for more details on autocomplete.

### The dot command

With the dot command you can repeat the last action

### Visual Mode

- ```V``` - line wise selection
- ```v``` - character wise selection
- ```<ctrl>v``` - block wise selection


### Plugins

- [vim-commaobject](http://github.com/austintaylor/vim-commaobject)
- [vim-sparkup](http://github.com/tristen/vim-sparkup)
- [html5.vim](http://github.com/othree/html5.vim)
- [vim-repeat](http://github.com/tpope/vim-repeat)
- [vim-surround](http://github.com/tpope/vim-surround)
- [hardmode](http://github.com/wikitopian/hardmode)
- [vim-gitgutter](http://github.com/airblade/vim-gitgutter)
- [vim-fugitive](http://github.com/tpope/vim-fugitive)
- [ag.vim](http://github.com/rking/ag.vim)
- [ultisnips](http://github.com/sirver/ultisnips)
- [vim-snippets](http://github.com/mjacobus/vim-snippets)
- [tcomment_vim](http://github.com/tomtom/tcomment_vim)
- [vim-easymotion](http://github.com/Lokaltog/vim-easymotion)
- [auto-pairs](http://github.com/yukunlin/auto-pairs)
- [gist-vim.git](http://github.com/mattn/gist-vim.git)
- [nerdtree](http://github.com/scrooloose/nerdtree)
- [ctrlp.vim](http://github.com/kien/ctrlp.vim)
- [tabular](http://github.com/godlygeek/tabular)
- [syntastic](http://github.com/scrooloose/syntastic)
- [argumentrewrap](http://github.com/weierophinney/argumentrewrap)
- [php-getter-setter.vim](http://github.com/docteurklein/php-getter-setter.vim)
- [vdebug](http://github.com/joonty/vdebug)
- [phpcomplete.vim](http://github.com/shawncplus/phpcomplete.vim)

### Color Schemes

- [vim-lucius](http://github.com/jonathanfilip/vim-lucius)
- [vim-colors-solarized](http://github.com/altercation/vim-colors-solarized)

## Resources:

- [Video](https://www.youtube.com/watch?v=_NUO4JEtkDw)
- [Blog Post](https://mikecoutermarsh.com/learning-vim-in-a-week/)
- [Some VIM classes](https://github.com/shawncplus/vim-classes)
