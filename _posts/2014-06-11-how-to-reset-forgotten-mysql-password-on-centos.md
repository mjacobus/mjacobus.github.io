---
layout: post
title: How to reset forgotten MySQL root password on CentOS
tags: [MySQL, Linux, CentOS]
---

{% highlight bash %}
# service mysqld stop
# mysqld_safe --skip-grant-tables &
# mysql --user=root mysql

MYSQL> update user set Password=PASSWORD('new-password') where user='root';
MYSQL> flush privileges;
MYSQL> exit;

# service mysqld restart
{% highlight %}

[This](https://www.howtoforge.com/reset-forgotten-mysql-root-password) is the source.
