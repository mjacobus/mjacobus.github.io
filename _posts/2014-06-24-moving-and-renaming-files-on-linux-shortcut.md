---
layout: post
title: Moving and renaming files on linux (shortcut)
tags: post
---

I just found a great alternative to the following command:

{% highlight bash %}
mv /tmp/a/b/c /tmp/a/b/d
{% endhighlight %}

Well, turns out there is a short hand alternative for accomplishing the same result:

{% highlight bash %}
mv /tmp/a/b/{c,d}
{% endhighlight %}
