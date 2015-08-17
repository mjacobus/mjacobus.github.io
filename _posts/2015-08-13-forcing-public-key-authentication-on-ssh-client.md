---
layout: post
title: Forcing public key authentication on ssh client
tags: [Linux, CLI, SSH]
---

Just do that.

{% highlight bash %}
ssh user@host -o PreferredAuthentications=publickey
{% endhighlight %}

And if you want to use a different key

{% highlight bash %}
ssh user@host -i /path/to/id_rsa
{% endhighlight %}
