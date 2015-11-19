---
layout: post
title: Fixing Rack::Timeout::RequestTimeoutError in continuous integration
tags: [Ruby, Rails, CI]
---

I was getting [this](https://travis-ci.org/mjacobus/rubyjobsbrazil/builds/92013004)
error in Travis CI.


{% highlight bash %}
 1) Jobs Management when user is not logged he publishes a job
     Failure/Error: visit root_path
     Rack::Timeout::RequestTimeoutError:
       Request ran for longer than 15000ms
     # ./spec/features/jobs_management_feature_spec.rb:9:in `block (3 levels) in <top (required)>'
{% endhighlight %}

Moving the rack-timeout gem to the staging/production group fixed it.

{% highlight ruby %}
group :staging, :production do
  gem 'rack-timeout'
end
{% endhighlight %}

Credits: [this](https://github.com/heroku/rack-timeout/issues/80/#issue-88681298) issue.
