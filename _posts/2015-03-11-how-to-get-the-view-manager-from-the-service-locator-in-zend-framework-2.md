---
layout: post
title: How to get the view manager from the service locator in Zend Framework 2
tags: [ZF2, PHP]
---

This is how you can get the view helper manager from the service locator/service manager.

{% highlight php %}
<?php
$viewHelperManager = $serviceManager->get('ViewHelperManager');
{% endhighlight %}


For the form element manager:

{% highlight php %}
<?php
$formElementManager = $serviceManager->get('FormElementManager');
{% endhighlight %}


[Source](https://juriansluiman.nl/article/120/using-zend-framework-service-managers-in-your-application).
