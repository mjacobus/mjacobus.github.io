---
layout: post
title: Creating a Windows 7 recovery disk on linuxc
tags: [Linux, CLI, Windows7]
---

I had a hard time trying to achieve the above. Every time I tried to copy create a usb recovery disk for windows 7 it did not work. I could write the files, but it would not boot, despite flagging the partition as bootable.

I found [this post](http://www.linuxquestions.org/questions/linux-software-2/creating-windows-7-bootable-usb-from-linux-762229/#post3946086) that solved the problem.

First, mount the recoverable cd you have or extract the iso image by running the following command:

{% highlight bash %}
sudo mount -o loop recovery_cd.iso /tmp/windowsboot
{% endhighlight %}

Then format your USB drive as NTFS and mark the partition as bootable.

Copy the files to your USB.

{% highlight bash %}
cp -rvf /tmp/windowsboot/* /mnt/your-usb-folder
{% endhighlight %}

Download the latest stable version of ms-sys and install it.

{% highlight bash %}
tar xzvf ms-sys-2.2.1.tar.gz -C /tmp

cd /tmp/ms-sys-2.2.1

make

sudo make install
{% endhighlight %}

Once it is installed you can write the windows 7 MBR to your USB drive (root permissions required):

{% highlight bash %}
ms-sys -7 /dev/sdX
{% endhighlight %}

Thats it.
