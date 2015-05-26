---
layout: post
title: Using Git as a SVN client
tags: [Git]
---

So you are stuck with SVN, huh? So here is what you will do:

{% highlight bash %}
git svn clone -s --prefix=origin/ https://svn.url/projects/{my_project}
{% endhighlight %}

This assumes that you have ```{my_project}/trunk```, ```{my_project}/tags``` and ```{my_project}/branches```

Work the same way as you work with git, except that:

Instead of pushing you:

{% highlight bash %}
git svn dcommit
{% endhighlight %}

And instead of pulling you:

{% highlight bash %}
git svn rebase
{% endhighlight %}

You can fetch by running the command:

{% highlight bash %}
git svn fetch
{% endhighlight %}

Avoid pushing/pulling to/form different sources. Use it as it was not a distributed versioning system.

Here is an [example](https://gist.github.com/mjacobus/34b3aae09a2c36926dd6) of script for testing how you can use git-svn.
