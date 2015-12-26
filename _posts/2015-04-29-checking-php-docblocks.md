---
layout: post
title: Checking PHP DocBlocks
tags: [PHP, QATools]
comments: true
---

This is how you can check it:


{% highlight bash %}
phpcs {files} --standard=Squiz \
  --sniffs=Squiz.Commenting.FunctionComment,Squiz.Commenting.FunctionCommentThrowTag,Squiz.Commenting.ClassComment,Squiz.Commenting.FileComment,Squiz.Commenting.VariableComment
{% endhighlight %}

I found this on [stackoverflow](http://stackoverflow.com/questions/13767550/is-there-a-phpcs-standard-targeting-php-docblocks).
