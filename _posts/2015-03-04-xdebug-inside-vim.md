---
layout: post
title: Using Xdebug inside vim
tags: [PHP, Vim]
---

- Install [vdebug](https://github.com/joonty/vdebug).
- Configure xdebug and restart your php-fpm and apache/nginx.

Here is the configuration I used. They can be found in the php.ini or in a aditional
ini file, which was my case, in Ubuntu.

{% highlight ini %}
; /etc/php5/mods-available/xdebug.ini
zend_extension=/usr/lib/php5/20121212/xdebug.so

xdebug.remote_enable       = 1
xdebug.remote_port         = 9000
{% endhighlight %}

- Go to the line you want to debug and press F10 to mark line as a break point.
- Click F5 to listen for the connection
- Use F2 to jump break points

For more detailed information just read the vdebug README.

## Debugging remotely

Now, lets say you mounted the files you are working on on your computer via nfs
and you want to be able to debug.

Add the following configuration to the server xdebug entry.

{% highlight ini %}
xdebug.remote_connect_back = 1
{% endhighlight %}
