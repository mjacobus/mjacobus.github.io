---
layout: post
title: What files did I change in the last two weeks?
tags: [Git, CLI]
comments: true
---

Every time we have a code review I need to fix some things. Besides bad design,
off course, some docblocks are missing, anotations and so on.

It is not so easy to remember what files I changed, so here's one easy way of doing
that using git, that I just found out:

{% highlight bash %}
git log --since="2 weeks ago" --author={username} --name-only --format="%-" | sort -u
{% endhighlight %}

It searches the log history, filtering by date, author and only
displaying filenames. The pipe in the end will sort the files and make sure they
appear in the list only once.

Now, if I want to edit them, I can simply do the following:
{% highlight bash %}
vim $(git log --since="2 weeks ago" --author={username} --name-only --format="%-" | sort -u)
{% endhighlight %}
