---
layout: post
title: Listing a process using a particular TCP port
tags: [CLI]
comments: true
---

Here is how you get the pid:

{% highlight bash %}
lsof -i tcp:8080 -t
{% endhighlight %}
