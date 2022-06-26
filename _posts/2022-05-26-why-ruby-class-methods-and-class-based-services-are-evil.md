---
layout: post
title:  "Why class methods and class based services are evil"
categories: [Rails, Ruby]
---

This is an entry written on a weekend, in a rush, just as an attempt to raise awareness about a common practice in the ruby world.

I am a big fan of object oriented design. Also a big fan of SOLID principles, which apply to OOD. Those principles help take OO advantages to the full. I'd say the biggest advantages are encapsulation and composability.

Class methods (aka static methods) can't take full advantage of neither, as they are basically functions that live on a namespace (better than a plain function, that uses the global namespace). In ruby/rails community, one common pattern for service objects is based on class methods. Though they vary, they are basically like:


One base class may be defined.

{% highlight ruby %}
class Service
  def self.call(*args)
    new.call(args)
  end

  def call
    raise "Not implemented yet"
  end
end
{% endhighlight %}

Then a service extends that service

{% highlight ruby %}
class AccountUpdator < Service
  def initialize(id, params)
    @account_id = id
    @params = params
  end

  def call
    account = Account.find(@account_id)
    account.update(@params)
  end
end
{% endhighlight %}

And then it used like so:

{% highlight ruby %}
AccountUpdator.call(1, { email: "foo@bar.com" })
{% endhighlight %}

The "interface" here is defined by `call(id, params)`. `call` is not super meaningful, as all services will implement it. The difference is in the arguments. Maybe. And yes, the class name help understand what function will do.

Not too bad. But imagine there is a change. Each account can connect to a cloud service for storing images. The application support several flavors of cloud. Each one with a different API. And now, the account Updator should be able to upload a logo to the cloud.


The account service should be changed as so:


{% highlight ruby %}
class AccountUpdator < Service
  def initialize(id, params, cloud_service)
    @account_id = id
    @params = params
    @cloud_service = cloud_service
  end

  def call
    account = Account.find(@account_id)

    if @params[:logo]
      @cloud_service.upload(@params[:logo], file_name: "logo.jpg")
    end

    account.update(@params)
  end
end
{% endhighlight %}

Then the service should now be called like this:

{% highlight ruby %}
AccountUpdator.call(
  1,
  { email: "foo@bar.com", file: file },
  cloud_service # the new dependency has to be injected by the caller
)
{% endhighlight %}

The problem now is that the interface changed. Not only that, but the caller needs to inject all the dependencies the service needs. That means the caller needs more knowledge of the service internals. That means the encapsulation got weaker. Also it is no longer "Liskov Substitutable" or "Opened/Closed".

> There are other ways to work around that, like in that specific example, the `Account` class could find the correct cloud service based on the account id. But that is just a contrived example to illustrate one of the downsides of class methods. Other changes could apply. Like the service could eventually become dependent on a cache layer, other APIs, email/notification and so on.

How to solve it? Ditch class methods in favor of SOLID services. Like so:

{% highlight ruby %}
class AccountSevice
  def initialize(cloud_service:)
    @cloud_service = service
  end

  def update(id, params)
    account = Account.find(@account_id)

    if @params[:logo]
      @cloud_service.upload(@params[:logo], file_name: "logo.jpg")
    end

    account.update(@params)
  end
end
{% endhighlight %}

Always call like this:

{% highlight ruby %}
# the instance
account_service.update(1, { email: "foo@bar.com", file: file })
{% endhighlight %}

Need a cache service? Inject it to the service constructor. Callers don't need to know.



## Does it matter?

All that is just code and code serves the purpose of building a product. It can
totally work without it. We don't need SOLID, OO, or any kind of practice. I agree.

But with the "it works, lets ship it" mindset, we can dismiss just about any
code review suggestion, other than bug fixes.

Undescriptive variable name? Typo? It does not matter. It works. The tests are green.

But there is always some kind of bar, that is why we have code reviews, static
analyzers and that kinda a stuff. My goal here is to set the bar a little
higher by applying those principles.

