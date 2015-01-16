---
layout: post
title: Testing rails mountable engine routes with rspe
ctags: [Rails, Ruby, Rspec]
---

{% highlight ruby %}
describe Gossiper::NotificationsController, 'routing' do
   # here's the trick
   routes { Gossiper::Engine.routes }

  it "routes to index" do
    expect(get('/notifications')).to
      route_to('gossiper/notifications#index')
  end
end
{% endhighlight %}
