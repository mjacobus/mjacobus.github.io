---
layout: post
title: "Google Chrome won't allow to select text: how to fix"
tags: [Linux, Google Chrome]
---

For some stupid reason I don't even want to try to understand, Google Chrome
sometimes won't allow you to select text. Apparently it thinks you have a touch
device.

How to fix:

Open the configuration file (in my case, on a Ubuntu box it is
```/usr/share/applications/google-chrome.desktop```) and append ``` --touch-devices=123``` 
to all the lines that start with ```Exec=```.

To do that in the command line you can run the following command:

{% highlight bash %}
sudo sed -i "s/\(Exec=.*\)$/\1 --touch-devices=123/g" /usr/share/applications/google-chrome.desktop
{% endhighlight %}

You may want to append ``` --touch-devices=123``` when you call google-chrome from the CLI and even create an alias for that:

{% highlight bash %}
alias google-chrome="google-chrome --touch-devices=123"
{% endhighlight %}

Thanks to Josué for digging very deep on the internet and finding the fix!
