---
layout: post
title: Fixing NoMethodError: undefined method size for nil:NilClass
tags: [Rails, Ruby]
---
I got this error when trying to bundle an Rails 4 application. My ruby version was ruby-2.0.0-p195.

## How I got it fixed

{% highlight bash %}
rvm get stable

rvm install 2.0.0 # installed ruby-2.0.0-p247

opened another terminal session

gem install bundle

cd myapp && bundle install
{% endhighlight %}
