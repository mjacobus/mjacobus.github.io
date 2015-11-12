---
layout: post
title: Port forwarding with ssh tunneling
tags: [Linux, SSH]
---

Say you want to be able to access a web server in a remote unix but port 80 is
not exposed to the world. Still, you have ssh access to that.

Here is what you can do:

```bash
ssh -N -L localhost:8080:localhost:80 -p 22 user@remote
```

Then you can access the page on port 8080 in your local computer:

[http://localhost:8080](http://localhost:8080)

Ta da!

Note that the second occurrence of the word 'localhost' will be evaluated on your
remote computer. Then, the first localhost will point to your local computer, but
the second to the remote. Same thing for the ports.

```bash
ssh -N -L local_address:local_port:address_in_remote:port_in_remote -p 22 user@localhost
```

