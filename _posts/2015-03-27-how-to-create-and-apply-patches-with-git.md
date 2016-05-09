---
layout: post
title: How to create and apply patches with git
tags: [Git]
comments: true
---

This is how I created a patch with the diffs I wanted to apply:

{% highlight bash %}
git diff HEAD branch-whose-changes-i-want-to-aply > /tmp/diff.patch
{% endhighlight %}

And here is how to apply;


{% highlight bash %}
git apply /tmp/patch.diff
{% endhighlight %}


## Resolving conflicts:

If it fails, you can run:

{% highlight bash %}
git am -3 < /tmp/patch.diff
{% endhighlight %}

Source [here](http://stackoverflow.com/questions/16190387/when-applying-a-patch-is-there-any-way-to-resolve-conflicts).
