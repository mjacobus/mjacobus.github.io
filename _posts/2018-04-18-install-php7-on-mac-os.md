---
layout: post
title: Install PHP7 on mac os
tags: [PHP, MacOS]
comments: true
---

Here it goes


{% highlight bash %}

brew tap homebrew/homebrew-php
brew install php72
brew install homebrew/php/php72-xdebug
export PATH="$PATH:`brew --prefix php`"

{% endhighlight %}
