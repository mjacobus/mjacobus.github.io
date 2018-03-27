---
layout: post
title: Gem loading problems with spring
tags: [MacOS, Bundle, Ruby]
comments: true
---

Sometimes, while running specs with spring preloader, I got the warnings that some times led to erros, like follows:


```bash
./bin/rspec spec/some/class_spec.rb:12
WARN: Unresolved specs during Gem::Specification.reset:
      spring (>= 0.9.1)
WARN: Clearing out unresolved specs.
Please report a bug if this causes problems.
Please report a bug if this causes problems.
/path/.gem/ruby/2.4.3/gems/snappy-0.0.17/lib/snappy.rb:5:in `require': dlopen(/path/.gem/ruby/2.4.3/gems/snappy-0.0.17/lib/snappy_ext.bundle, 9): Library not loaded: /usr/local/opt/snappy/lib/libsnappy.1.1.5.dylib
  Referenced from: /path/.gem/ruby/2.4.3/gems/snappy-0.0.17/lib/snappy_ext.bundle
  Reason: image not found - /path/.gem/ruby/2.4.3/gems/snappy-0.0.17/lib/snappy_ext.bundle (LoadError)
        from /path/.gem/ruby/2.4.3/gems/snappy-0.0.17/lib/snappy.rb:5:in `<top (required)>'
        from /path/.gem/ruby/2.4.3/gems/xing-logjam-agent-1.5.0/lib/xing/logjam/agent/railtie.rb:4:in `require'
        from /path/.gem/ruby/2.4.3/gems/xing-logjam-agent-1.5.0/lib/xing/logjam/agent/railtie.rb:4:in `<top (required)>'
        from /path/.gem/ruby/2.4.3/gems/xing-logjam-agent-1.5.0/lib/xing/logjam/agent.rb:2:in `require'
        from /path/.gem/ruby/2.4.3/gems/xing-logjam-agent-1.5.0/lib/xing/logjam/agent.rb:2:in `<top (required)>'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler/runtime.rb:95:in `require'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler/runtime.rb:95:in `rescue in block in require'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler/runtime.rb:72:in `block in require'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler/runtime.rb:65:in `each'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler/runtime.rb:65:in `require'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/bundler.rb:114:in `require'
        from /path/.rb:10:in `<top (required)>'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:82:in `require'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:82:in `preload'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:143:in `serve'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:131:in `block in run'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:125:in `loop'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application.rb:125:in `run'
        from /path/.gem/ruby/2.4.3/gems/spring-1.7.2/lib/spring/application/boot.rb:19:in `<top (required)>'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/rubygems/core_ext/kernel_require.rb:59:in `require'
        from /path/.rubies/ruby-2.4.3/lib/ruby/site_ruby/2.4.0/rubygems/core_ext/kernel_require.rb:59:in `require'
```

One way of fixing the above error is by installing snappy globally:

```bash
gem install snappy
```

That is terrible however, because it means developers must install every problematic gem individually. I have no idea what
could cause that problem, but the above works. One alternative and better solution was:


```bash
bundle clean --force
bundle install
```
