---
layout: post
title: Fixing installation problems on mac
tags: [MacOs]
comments: true
---


Error installing mysql gem

{% highlight bash %}

bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix openssl)"

{% endhighlight %}



- [source](https://github.com/brianmario/mysql2/issues/795#issuecomment-433219176)
