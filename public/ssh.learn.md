---
date: 2019-03-21T10:39:17.000Z
title: SSH
---



How to generate a new key
----------------

```shell
ssh-keygen -b 4096 -t rsa -C fabien@domain.tld

# Without asking question! Make sure there is no typo
ssh-keygen -b 4096 -t rsa -C fabien@domain.ch -N '' -q -f ~/.ssh/id_domain
cat ~/.ssh/id_domain
```

**Create a backup after that!** 

`cp -r .ssh ~/pCloudDrive/Crypto\ Folder/FabienIdentity/SshBackup/ssh_2020.mm.dd`

More secured?  To be decided...

```shell
ssh-keygen -t ed25519 -o -a 100 -C "fabien@omic.ch"
ssh-keygen -t rsa -b 4096 -o -a 100 -C "fabien.udriot@cobweb.ch"
```

How can I SSH hop
-------

```shell
ssh -o ProxyCommand='ssh coweb@firewall.ill.fr -p 5023 nc -w 10 %h %p' root@wwwnew.ill.fr
```

How to encrypt the SSH private key?
-----------------------------------

```shell
cp id_rsa id_rsa.old
openssl rsa -in id_rsa -out id_rsa.crypt -aes256
mv id_rsa.crypt id_rsa
```

Where is the log file located
--------

Into `/var/log/auth.log`

Encrypt / decrypt the known hot
----------------------------

hash known host - sshd_config
<http://unix.stackexchange.com/questions/31549/is-it-possible-to-find-out-the-hosts-in-the-known-hosts-file>

Jumping Through Servers
-----------------------

```shell
Host db
  HostName db.internal.example.com
  ProxyCommand ssh gateway -W %h:%p
```

How to re-generate the public from the private key?
-------------------

```shell
ssh-keygen -y -f id_rsa > id_rsa.pub
```

TUNNEL SSH
----------

```shell
# -N option add "No execute command"
ssh -N -L 5901:localhost:5900 root@dev.ecodev.ch
ssh -N -L 5901:localhost:5900 root@mail.ecodev.ch
```