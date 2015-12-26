---
layout: post
title: Solving weird Capistrano problems with ssh authentication
tags: [Capistrano, SSH, CLI]
comments: true
---

So I got the following error when trying to deploy:

{% highlight bash %}
cap staging deploy
{% endhighlight %}

Error:

{% highlight bash %}
cap aborted!
SSHKit::Runner::ExecuteError: Exception while executing as staginguser@staginghost: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing writtenSSHKit::Command::Failed: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing writtenTasks: TOP => git:check
(See full trace by running task with --trace)
The deploy has failed with an error: Exception while executing as staginguser@staginghost: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing written 

-- WITH TRACE
cap aborted!
SSHKit::Runner::ExecuteError: Exception while executing as staginguser@staginghost: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing written
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/runners/parallel.rb:16:in `rescue in block (2 levels) in execute'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/runners/parallel.rb:12:in `block (2 levels) in execute'
SSHKit::Command::Failed: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing written
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/command.rb:95:in `exit_status='
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:179:in `block in _execute'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:133:in `tap'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:133:in `_execute'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:66:in `execute'
/home/user/.rvm/gems/ruby-2.2.1/gems/capistrano-3.4.0/lib/capistrano/git.rb:11:in `git'
/home/user/.rvm/gems/ruby-2.2.1/gems/capistrano-3.4.0/lib/capistrano/git.rb:21:in `check'
/home/user/.rvm/gems/ruby-2.2.1/gems/capistrano-3.4.0/lib/capistrano/tasks/git.rake:28:in `block (4 levels) in <top (required)>'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/abstract.rb:85:in `with'
/home/user/.rvm/gems/ruby-2.2.1/gems/capistrano-3.4.0/lib/capistrano/tasks/git.rake:27:in `block (3 levels) in <top (required)>'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:54:in `instance_exec'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/backends/netssh.rb:54:in `run'
/home/user/.rvm/gems/ruby-2.2.1/gems/sshkit-1.7.1/lib/sshkit/runners/parallel.rb:13:in `block (2 levels) in execute'
Tasks: TOP => git:check
The deploy has failed with an error: Exception while executing as staginguser@staginghost: git exit status: 128
git stdout: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
fatal: The remote end hung up unexpectedly
git stderr: Nothing written
** Invoke deploy:failed (first_time)
** Execute deploy:failed 
{% endhighlight %}


## The solution

This stackoverflow [post](http://stackoverflow.com/questions/28375506/sshkitrunnerexecuteerror) helped me.

This seems to have solved the problem:

{% highlight bash %}
ssh-add ~/.ssh/id_rsa.ppk
{% endhighlight %}

It could be that the ssh-agent was not running, and if it was not, the following command is supposed to start it:

{% highlight bash %}
eval `ssh-agent`
{% endhighlight %}

I am not familiar with those commands, but they helped me and I should learn more about them in the near future.
