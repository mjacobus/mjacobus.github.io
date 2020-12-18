---
layout: post
title:  "Hacking your Rails app error handler"
categories: [Rails Hack]
---

Sometimes applications won't respond to json requests with json responses. If
that is the case for production, that is a bug.  But sometimes, in development
environment, developers leave unknown exceptions unhandled and then requests
get responded with HTML. If you, like me, find that annoying - because frontend
does not know how to parse the ajax response or because you are performing a
curl request in your terminal, you can still work around it without changing
the app - and perhaps annoying your colleagues.

Just create an initializer with the following content:

{% highlight ruby %}
# config/initializers/your_name.rb

ActionController::Base.class_eval do
  rescue_from Exception do |error|
    if request.format.json?
      json = {
        error: {
          type: error.class.to_s,
          message: error.message,
          backtrace: error.backtrace.select do |line|
            line.match?(Rails.root.to_s)
          end
        }
      }
      render json: json, status: 500
      next
    end

    raise error
  end
end
{% endhighlight %}


Then make sure you will never check that file in:

{% highlight bash %}
echo config/initializers/your_name.rb >> ~/.gitignore_global
{% endhighlight %}

