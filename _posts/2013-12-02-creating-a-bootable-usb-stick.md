---
layout: post
title: Creating a bootable usb stick
tags: [Linux, CLI]
---

{% highlight bash %}
sudo dd if=image.iso of=/dev/sdX bs=4096
{% endhighlight %}

