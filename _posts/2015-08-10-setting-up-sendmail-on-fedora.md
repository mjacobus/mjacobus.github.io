---
layout: post
title: Setting up Sendmail on Fedora
tags: [Linux, CLI]
comments: true
---

## TLDR;

This is the TLDR version.

{% highlight bash %}
sudo yum install sendmail
sudo make all -C /etc/mail/
sudo service sendmail start
{% endhighlight %}

## Testing:

{% highlight bash %}
echo "Subject: test" | /usr/sbin/sendmail -v my@email.com
{% endhighlight %}


The long version is here (I did not read):

Source [here](https://docs.fedoraproject.org/en-US/Fedora/21/html/System_Administrators_Guide/s2-email-mta-sendmail.html)
