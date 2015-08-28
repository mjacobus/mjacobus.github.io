---
layout: post
title: My first steps on my brand new mac air
tags: [MacOS]
---

So today I got my Mac Air 13", 8GB. I am a brand new mac user and I chose this product
because it sutes me well. Besides the very nice finishings (I may be inventing a word here)
that battery lasts forever. I can program the whole time in a flight from Germany to Brasil!


Well, here are the things I remember I did today:

I tried to run git, and it warned me that I should install Xcode Cli something.
It did it for me.

After that, I downloaded thoughtbot's
[laptop](http://github.com/thoughtbot/laptop) and ran it. It installed mostly
all the tools I need for development. PHP was already installed.

Then I installed my [dotfiles](http://github.com/mjacobus/.dotfiles) and after
making some adjustments it seems to work fine.

I faced one problem with vim (the original vim was replaced by the latest
version, by the laptop script). The problem is (still is by the time of this
writting) that I cannot yank text. When I delete text, that goes to the system
clipboard, but when I yank, nothing happens.

I installed neovim, and it was pretty strait forward. I also installed python3,
and it was very easy, unlike doing that on the linux boxes I work regularly.

{% highlight bash %}
$ brew tap neovim/neovim
$ brew install --HEAD neovim
$ brew install python3
$ pip install neovim
{% endhighlight %}

I installed macvim, in the hope the yanking problem would be working there, but
I was mistaken. Plus, in order to install macvim I had to install the whole
xcode app and not just the lean CLI version of that.

I installed mysql with homebrew and that was pretty easy.

I cloned a ruby project and a php project and made sure that I could install
dependencies and run the tests. It worked fine.

My wife is now installing Photoshop and light room. Lets see how much disk it
will use and how it will perform on this notebook. We hope we can buy her Mac
Pro anytime soon

Well, so far the only thing that I know I need to fix is the yanking problem in VIM.
