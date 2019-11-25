---
date: 2019-03-21T10:39:14.000Z
title: Firewall - iptables
---

## Commands IPTABLES

```
    service iptables status
    service iptables stop
    service iptables start
```

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
