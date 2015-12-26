---
layout: post
title: Removing git references to unexisting remote branches
tags: [Git]
comments: true
---

Sometimes you remove a branch via web (github, gitlab...) but you still have its reference when you run:

{% highlight bash %}
$ git branch -a
{% endhighlight %}

{% highlight bash %}
remotes/origin/featur-cool-feature-we-are-working-right-now
remotes/origin/feature-removed-long-ago # This guy is about to die!
{% endhighlight %}

You can eliminate the old references by running

{% highlight bash %}
$ git remote prune {target}
{% endhighlight %}

Where target will be most likely "origin".

{% highlight bash %}
$ git remote prune origin
URL: git@github.com:my_user/my_project.git
 * [pruned] origin/featur-removed-long-ago
{% endhighlight %}

[Source](http://stackoverflow.com/questions/1072171/how-do-you-remove-an-invalid-remote-branch-reference-from-git).
