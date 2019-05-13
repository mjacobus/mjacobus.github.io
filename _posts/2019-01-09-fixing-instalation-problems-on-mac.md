---
layout: post
title: Fixing installation problems on mac
tags: [MacOs]
comments: true
---


## Error installing mysql gem

{% highlight bash %}

bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix openssl)"

{% endhighlight %}



- [source](https://github.com/brianmario/mysql2/issues/795#issuecomment-433219176)



## Bundler

{% highlight bash %}

Traceback (most recent call last):
        2: from /Users/marcelojacobus/.asdf/installs/ruby/2.5.3/bin/bundle:23:in `<main>'
        1: from /Users/marcelojacobus/.asdf/installs/ruby/2.5.3/lib/ruby/2.5.0/rubygems.rb:308:in `activate_bin_path'
/Users/marcelojacobus/.asdf/installs/ruby/2.5.3/lib/ruby/2.5.0/rubygems.rb:289:in `find_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)
Traceback (most recent call last):
        2: from /Users/marcelojacobus/.asdf/installs/ruby/2.5.3/bin/bundle:23:in `<main>'
        1: from /Users/marcelojacobus/.asdf/installs/ruby/2.5.3/lib/ruby/2.5.0/rubygems.rb:308:in `activate_bin_path'
/Users/marcelojacobus/.asdf/installs/ruby/2.5.3/lib/ruby/2.5.0/rubygems.rb:289:in `find_spec_for_exe': can't find gem bundler (>= 0.a) with executable bundle (Gem::GemNotFoundException)
{% endhighlight %}


The fix

{% highlight bash %}
gem install bundler -v 1.16
{% endhighlight %}
