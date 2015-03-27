---
layout: post
title: How to create and apply patches with git
tags: [Git]
---

This is how I created a patch with the diffs I wanted to apply:

{% highlight bash %}
git diff HEAD branch-whose-changes-i-want-to-aply > /tmp/diff.patch
{% endhighlight %}

And here is how to apply;


{% highlight bash %}
git apply /tmp/patch.diff
{% endhighlight %}
