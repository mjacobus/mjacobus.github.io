---
layout: post
title: Composer Library Skeleton
tags: [PHP, Composer]
comments: true
---

I often extract code I use into libraries so I can reuse them. Creating a new
library is a bit overwhelming since there is plenty of boilerplate code to
write, specially if you want to integrate your library with style checkers,
continuous integration services and things of the kind.

So today, before creating my next lib I decided to create a template for my
libraries. I wanted something as simple and elegant as ```bundle gem
{gemname}```.

Turns out composer allows you to easily [create project](https://getcomposer.org/doc/03-cli.md#create-project)
by using templates (skeletons). I found [this](https://www.binpress.com/tutorial/better-project-skeletons-with-composer/157)
article that gave me some insights on how to build my own template.

It contains badges for Travis CI, Coveralls, Code climate, Scrutinizer, Style
CI, Packagist, Gemnasium and more. Of course, you need to manually integrate
the services to your github repo.

It is hosted [here](https://github.com/mjacobus/php-library-skeleton) and this
is how you use it:

{% highlight bash %}
composer create-project -sdev mjacobus/library-skeleton /path/to/project
{% endhighlight %}

After that you can run:

{% highlight bash %}
cd /path/to/project
./bin/configure_project.sh
{% endhighlight %}

It will asked for your library information, and replace the placeholders in the templates.
After that you should be ready to start working in the implementation of your lib.

