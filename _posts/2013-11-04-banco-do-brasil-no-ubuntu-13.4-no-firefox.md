---
layout: post
title: Banco do Brasil no Ubuntu 13.4 no Firefox
tags: [Linux]
---

Depois de instalar o java, parece que o que foi preciso fazer foi o seguinte:

{% highlight bash %}
sudo ln -s /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libnpjp2.so /usr/lib/firefox-addons/plugins
{% endhighlight %}

A dica veio [daqui](http://rodrigo.utopia.org.br/2012/10/08/acessando-o-banco-do-brasil-no-ubuntu-12-04-64bits/).

Funcionou do ubuntu 13.4.
