---
layout: post
title: Downloading all files from a folder with wget
tags: [Wget, CLI]
---

So you want to download all those [your favorite tv show here] videos from that nice index page.

Here’s what you do:

{% highlight bash %}
wget -c -r –no-directories –no-parent http://somewebsite.com/some-folder

-c – means “continue”, or resume
-r – means recursive
–no-directories – means wget won’t clone the website directory tree
–no-parent – means it won’t get files from parent folders
{% endhighlight %}
