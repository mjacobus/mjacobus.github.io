---
layout: post
title: Vim Autocompletion for PHP
tags: [Vim, PHP]
comments: true
---

You can achieve autocompletion like the cool IDEs (such as PHPStorm or
NetBeans) by using the built in [omni completion](http://vim.wikia.com/wiki/Omni_completion).

How you do that? Go to the variable you want to call a method on, and after the arrow invoke

{% highlight php %}
public function foo(Bar $bar)
{
    $bar->
}
{% endhighlight %}

{% highlight vim %}
<ctrl>x
{% endhighlight %}

Then you will read the following message:

"-- ^X mode (^]^D^E^F^I^K^L^N^O^Ps^U^V^Y)"

It means you can press Control (^) plus ](or D, or E, or F, or I, or K, or L, or N, or O, or Ps, or U, or V, or Y).
Each of the options is a different type of completion.

Go for Ctrl+O

{% highlight vim %}
<ctrl>x <ctrl>o
{% endhighlight %}

You will most likely read: "-- Omni completion (^O^N^P) Pattern not found".

The reason is that vim does not know anything about your methods yet. Instead
of implementing method indexing, VIM relies on [CTAGS](http://ctags.sourceforge.net/whatis.html).

Assuming you have ctags installed, you can run:

{% highlight bash %}
ctags
{% endhighlight %}

That will create a ```tags``` file which is an index of all your
functions/methods in your project. Go ahead, check how it looks like. Do not
forget to ignore it in your project.

The format of this tags file can be changed with options in the command line. I
do not remember what I should type to properly index my code, so I create a
```~/.ctags``` with [this](https://github.com/mjacobus/.dotfiles/blob/master/ctags) 
content. For starters just copy mine.  Remember that ```ctags --help``` is your friend.

When you have a config file you can just run ```ctags``` and forget about the
options. It will read from the config file. Command arguments have priority
over the config file.

Now that you have your tags file, you can try again.

{% highlight vim %}
<ctrl>x <ctrl>o
{% endhighlight %}

Now you should be able to read a list of methods. You can navigate with
```C-N``` (next) and ```C-P``` (previous).

But it may happen that instead of listing only the methods that belongs to that
particular object, it lists all of the methods in your project. The reason is
that ctags does not support php namespaces.

This is why you can install "[patched CTAGS](https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags)" as
described in the vim [phpcomplete](https://github.com/shawncplus/phpcomplete.vim)
plugin which you should totally use.

That should do it, but...

I found myself having some problems with omni complete in VIM, and do not know
the reason. For example I cannot get PHPUnit_Framework_TestCase methods, such
as ```assert*``` to be listed when I use patched ctags. I should take the time
to figure that out some day, but in the end those cases won't bother me so much
so I end up leaving with that.

I suppose the reason is that PHPUnit_Framework_TestCase lives in the global
namespace and patched ctags expects it to have at least one parent namespace.


## Conclusion

Autocomplete is an important feature for developers, and VIM autocomplete
options really rock. There is so much else to be talked about completion in
vim.  I briefly covered omni completion here. I admit that this particular type
of completion tend to be much better in heavy IDEs such as PHPStorm and
Netbeans, but I think it is good enough in VIM.

Please leave a comment if you need any help with that. I hope to record a video
showing how that can be done.
