--- 
layout: post
title: Formatting a USB flash drive on the Linux CLI
tags: [Linux, CLI]
comments: true
---

{% highlight bash %}
sudo mkdosfs -n 'Label' -I /dev/sdX
{% endhighlight %}
