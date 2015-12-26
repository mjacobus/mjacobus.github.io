---
layout: post
title: Saving sessions on vim
tags: [Vim]
comments: true
---

You can save the session by doing this:

{% highlight vim %}
:mksession ~/.yesterday.vim
{% endhighlight %}

Then tomorrow you can source that vim file and you'll have your old session back:

{% highlight vim %}
:source ~/.yesterday.vim
{% endhighlight %}

Alternatively you can open vim indicating what session you want to open

{% highlight vim %}
$ vim -S ~/.yesterday.vim
{% endhighlight %}
