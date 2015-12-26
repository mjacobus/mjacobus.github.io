---
layout: post
title: Batch resizing images on the Linux CLI
tags: [Linux, CLI]
comments: true
---

Make sure you have installed Image Magic


{% highlight bash %}
sudo apt-get install imagemagick
{% endhighlight %}

And then, from the command line:

{% highlight bash %}
mogrify -resize 50% *png      # keep image aspect ratio
mogrify -resize 320x240 *png  # keep image aspect ratio
mogrify -resize 320x240! *png # don't keep image aspect ratio
mogrify -resize x240 *png     # don't keep image aspect ratio
mogrify -resize 320x *png     # don't keep image aspect ratio
{% endhighlight %}
