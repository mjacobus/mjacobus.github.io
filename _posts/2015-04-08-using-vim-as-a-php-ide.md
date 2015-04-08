---
layout: post
title: Using VIM as a PHP IDE
tags: [Vim, PHP]
---

On this post I will try to share my vim adventure for the last 2 years. I've
been using only VIM developing for about 2 years now. On this post I will try
to explain why I chose VIM and how I use it for writing code, mostly PHP.

I will update this post as I have the time to do so.

## Why VIM?

- Powerful
- Fast
- You can dissmiss your mouse
- Available in every system
- Highly extensible
- Highly customizable
- Configuration can be versioned in a public repository such as github giving
  you the ability to have the very same configuration in every single computer
  you use VIM (workstation, laptop, PC)
- Once you are comfortable using VIM you can be very productive.

And plus you get to be cool =)

I love the command live interface. And the longest I can stay there, the better.

WIP

## Vim overview

### [Vim has modes](http://en.wikibooks.org/wiki/Learning_the_vi_Editor/Vim/Modes)

- Normal mode
- Insert mode
- Visual mode
- Command line mode

## Getting started with VIM

First thing you should keep in mind is that you will hate vim. Trust me, you
will. It can be very frustrating. But if you stick to it you will love it! I promiss you.

### Ground rules

- Stop using the mouse. Use`h` (left) `j`(down) `k`(up) `l`(right) (disable arrow keys)

To prevent you from being stupid add the following to you ~/.vimrc

{% highlight vim %}
nnoremap <Up> :echomsg "use k"<cr>
nnoremap <Down> :echomsg "use j"<cr>
nnoremap <Left> :echomsg "use h"<cr>
nnoremap <Right> :echomsg "use l"<cr>
{% endhighlight %}

- be patient

WIP

## Plugins

WIP

Resources:

[Video](https://www.youtube.com/watch?v=_NUO4JEtkDw)
[Blog Post](https://mikecoutermarsh.com/learning-vim-in-a-week/)
