---
title: Firewall - UFW
---

## What are the basic steps to protect a server?

Here are few commands with `ufw` (Uncomplicated Firewall)

```sh
# Add some default rules
ufw default deny incoming
ufw allow 22

# Same can done with the application name
ufw app list
ufw allow OpenSSH

# Enable UFW
ufw enable
ufw status [verbose]

# Disable UFW
ufw disable

# Delete a rule
ufw delete allow 80/tcp
```

Source:

https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-18-04#step-4-—-setting-up-a-basic-firewall

## LuLu : un firewall sortant open-source

<https://www.macg.co/logiciels/2018/03/lulu-un-firewall-sortant-open-source-101813>

## Save firewall rules

    iptables-save > /tmp/firewall-rules.txt
    iptables-restore < /tmp/firewall-rules.txt

## Difference BSD vs Linux

    ipfw -> firewall BSD
    iptables -> firewall Linux

## Commands IPTABLES

    service iptables status
    service iptables stop
    service iptables start

## IPFW

    # pour voir les connection
    netstat # connexion ouverte
    netstat -r ->
    netstat -r -n # table de routage
    lsof | grep httpd -> fichier ouvert

# Wath is the difference between IPtables and UFW?

Uncomplicated Firewall (ufw & gufw) is a firewall that is designed to be easy to use. It uses a command line interface consisting of a small number of simple commands, and uses iptables. iptables is already a very powerful tool by itself, but it’s syntax can get awkward at times and hard to figure out, so Ubuntu developers decided to make ufw (“The reason ufw was developed is that we wanted to create a server-level firewall utility that was a little bit more for `human beings`.”), which was to be simpler.

Source:

http://debianhelp.wordpress.com/2011/09/12/to-do-list-after-installing-ubuntu-11-10-aka-oneiric-ocelot/

## MacOS Soft

Radio Silence can stop any app from making network connections

<https://radiosilenceapp.com/>

# Haka pour le traitement de flux réseau

Firewall applicatif:

http://linuxfr.org/news/haka-pour-le-traitement-de-flux-reseau

http://www.bortzmeyer.org/haka.html

filtrage, sécurité, paquets, protocoles, etc...

# Example rule

# Allow outgoing www

```
iptables -A OUTPUT -p tcp --sport 513:65535 --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --sport 80 --dport 513:65535 -j ACCEPT
```

## LIST RULES

```
iptables -L
```

## STOP FIREWALL

```
iptables -P INPUT ACCEPT; iptables -F
```

## ENABLE RULE

```
iptables -A INPUT -i eth0 -p tcp --dport 20:22 -j ACCEPT;
iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -j ACCEPT
```

## ENABLE DNS (OTHERWISE SLOW DOWN SSH LOGIN)

```
iptables -A INPUT -p udp -s \$ISP_DNS_IP/32 --source-port 53 -d 0/0 -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --sport 53 -j ACCEPT -> (A TESTER)
iptables -A INPUT -p udp --sport 53 -j ACCEPT -> (A TESTER)
```

## ACCEPT PING

```
iptables -A INPUT -i eth0 -p icmp -j ACCEPT
```

## SAVE IPTABLES

```
sudo sh -c "iptables-save > /etc/iptables.rules"
iptables-save > /etc/iptables.rules
```

## RESTORE IPTABLES SET UP

```
echo '#!/bin/sh' > /etc/network/if-pre-up.d/iptables-load
echo "iptables-restore < /etc/iptables.rules" >> /etc/network/if-pre-up.d/iptables-load
chmod +x /etc/network/if-pre-up.d/iptables-load
```

hint: to set up an automatic save "if-post-down"
https://help.ubuntu.com/community/IptablesHowTo

## EXAMPLE CONFIG WITH MULTIPORT

```
iptables -P INPUT ACCEPT; iptables -F
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m multiport -p tcp --dport www,ssh,sftp,https -j ACCEPT
iptables -A INPUT -p udp -s 0/0 --sport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p icmp -j ACCEPT
iptables -A INPUT -j LOG -m limit
iptables -A INPUT -j REJECT

iptables -L
```
