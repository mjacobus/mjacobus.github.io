---
layout: post
title: Trying to install capybara-webkit
ctags: [Rails, Ruby, Rspec, Capybara]
---

Add the gem to your gem file

{% highlight ruby %}
# Gemfile
gem 'capybara-webkit'
{% endhighlight %}

And bundle

{% highlight bash %}
bundle install
{% endhighlight %}

Ooops! That gave me the error:

{% highlight bash %}
qmake: could not find a Qt installation of ”...
{% endhighlight %}

{% highlight bash %}
sudo apt-get install qt5-defaul
{% endhighlight %}

Bundle again and…

Project ERROR: Unknown module(s) in WT: webkitwidgets

{% highlight bash %}
sudo apt-get install libqt5webkit5-dev

sudo apt-get install qtquick1-5-dev qtlocation5-dev qtsensors5-dev qtdeclarative5-dev
{% endhighlight %}

And bundle…

and nooooooooo not again!

Than I ended up finding [this](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) article and than [that article](http://qt-project.org/doc/qt-4.8/install-x11.html).

{% highlight bash %}
sudo apt-get install libqt4-dev

sudo apt-get install libfontconfig1-dev libfreetype6-dev libx11-dev libxcursor-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxrandr-dev libxrender-dev
{% endhighlight %}

Ta da! I just lost the will to test javascript. =/
