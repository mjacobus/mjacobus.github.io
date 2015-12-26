---
layout: post
title: Resolving github token issue in composer
tags: [CLI, Composer, Github]
comments: true
---

## TLDR;

Visit your github [personal tokens page](https://github.com/settings/tokens),
create a new token and use it in the following command:

{% highlight bash %}
composer config -g github-oauth.github.com <oauthtoken>
{% endhighlight %}

You can read [this article](https://getcomposer.org/doc/articles/troubleshooting.md#api-rate-limit-and-oauth-tokens)
to understand the reason behind it.

See also [this](https://github.com/blog/1509-personal-api-tokens) link.

