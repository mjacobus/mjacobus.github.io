---
layout: post
title: Fixing error compiling gems on MacOS (Alternatively)
tags: [MacOS, Bundle, Ruby]
comments: true
---


If [this](/2015/10/09/fixing-error-compiling-native-extensions-on-mac-os.html) did not work...

## Project ERROR: Xcode not set up properly. You may need to confirm the license agreement by running /usr/bin/xcodebuild.

{% highlight bash %}
  current directory: /Users/marcelo.jacobus/.gem/ruby/2.3.5/gems/capybara-webkit-1.15.0
 /Users/marcelo.jacobus/.rubies/ruby-2.3.5/bin/ruby -r ./siteconf20180320-92074-jgag5q.rb extconf.rb
 Project ERROR: Xcode not set up properly. You may need to confirm the license agreement by running /usr/bin/xcodebuild.
 *** extconf.rb failed ***
 Could not create Makefile due to some reason, probably lack of necessary
 libraries and/or headers.  Check the mkmf.log file for more details.  You may
 need configuration options.

 Provided configuration options:
         --with-opt-dir
         --with-opt-include
         --without-opt-include=${opt-dir}/include
         --with-opt-lib
         --without-opt-lib=${opt-dir}/lib
         --with-make-prog
         --without-make-prog
         --srcdir=.
         --curdir
         --ruby=/Users/marcelo.jacobus/.rubies/ruby-2.3.5/bin/$(RUBY_BASE_NAME)
         --with-gl-dir
         --without-gl-dir
         --with-gl-include
         --without-gl-include=${gl-dir}/include
         --with-gl-lib
         --without-gl-lib=${gl-dir}/lib
         --with-zlib-dir
         --without-zlib-dir
         --with-zlib-include
         --without-zlib-include=${zlib-dir}/include
         --with-zlib-lib
         --without-zlib-lib=${zlib-dir}/lib
 Command 'qmake LIBS\ \+\=\ -L/usr/local/opt/openssl/lib\ -L/usr/local/opt/readline/lib\ -L/usr/local/opt/libyaml/lib\ -L/usr/local/opt/gdbm/lib' failed

 extconf failed, exit code 1
{% endhighlight %}

This was the fix.

{% highlight bash %}
sudo xcode-select -switch /Applications/Xcode.app/Contents/Develope
{% endhighlight %}
