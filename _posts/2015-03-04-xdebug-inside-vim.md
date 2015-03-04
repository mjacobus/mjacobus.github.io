---
layout: post
title: Using Xdebug inside vim
tags: [PHP, Vim]
---

- Install [vdebug](https://github.com/joonty/vdebug).
- Configure xdebug and restart your php-fpm and apache/nginx.

Here is the configuration I used.

{% highlight ini %}
zend_extension=/usr/lib/php5/20121212/xdebug.so

xdebug.idekey           = netbeans-xdebug
xdebug.default_enable   = 1
xdebug.remote_enable    = 1
xdebug.remote_handler   = dbgp
xdebug.remote_host      = localhost
xdebug.remote_port      = 9000
xdebug.remote_autostart = 1
{% endhighlight %}

- Go to the line you want to debug and press F10 to mark line as a break point.
- Click F5 to listen for the connection
- Use F2 to jump break points


For more detailed information just read the vdebug READEME.
