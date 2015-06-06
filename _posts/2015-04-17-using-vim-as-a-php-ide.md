---
layout: post
title: Using VIM as a PHP IDE
tags: [Vim, PHP]
---

On this post I will try to share my vim adventure for the last 2 years. I've
been using only VIM developing for about 2 years now. On this post I will try
to explain why I chose VIM and how I use it for writing code, mostly PHP.

I will update this post as I have the time.

## Why VIM?

- It's been around for a long time
- Terminal (I love the command live interface. And the longest I can stay there, the better)
  - Fast
  - Available on your ssh cowboy coding!
  - Awesome for remote pair programming with tmux
  - You can dismiss your mouse
- Available in every system
- Powerful
- Highly extensible
- Highly customizable
- Configuration can be versioned in a public repository such as github giving
  you the ability to have the very same configuration in every single computer
  you use VIM (workstation, laptop, PC)
- Once you are comfortable using VIM you can be very productive.
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

## Vim overview

[Vim has modes](http://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes)

- Normal mode
- Insert mode
- Visual mode
- Command line mode

## Moving around

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

**TO BE CONTINUED...**

## Insert Mode
## Visual Mode
## Plugins

## Resources:

- [Video](https://www.youtube.com/watch?v=_NUO4JEtkDw)
- [Blog Post](https://mikecoutermarsh.com/learning-vim-in-a-week/)
