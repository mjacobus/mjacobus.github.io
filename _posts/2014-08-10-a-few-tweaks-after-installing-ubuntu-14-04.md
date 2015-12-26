---
layout: post
title: A few tweaks after installing Ubuntu 14.04
tags: [Linux, Ubuntu]
comments: true
---

Terminal commands:

{% highlight bash %}
# Update system:
sudo apt-get update
sudo apt-get upgrade

# Restricted extras:
sudo apt-get install ubuntu-restricted-extras

# CCSM:
sudo apt-get install compizconfig-settings-manager

# if youuse gnome
sudo apt-get install gnome-tweak-tool
{% endhighlight %}

If you use unit (please do not):

{% highlight bash %}
# Unity Tweak Tool:
sudo apt-get install unity-tweak-tool

# ClassicMenu Indicator:
sudo add-apt-repository ppa:diesch/testing
sudo apt-get update
sudo apt-get install classicmenu-indicator

#Disable Overlay Scrollbars:
gsettings set com.canonical.desktop.interface scrollbar-mode normal
{% endhighlight %}

Other tweaks:

{% highlight bash %}
# Java:
sudo apt-get install icedtea-7-plugin openjdk-7-jre

# Flash Player:
sudo apt-get install flashplugin-installer
{% endhighlight %}

Awesome tips that I [mostly] got from the [Ubuntu Help Guy](https://www.youtube.com/user/UbuntuHelpGuy).
