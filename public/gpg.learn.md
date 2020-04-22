---
date: 2019-03-21T14:53:48.000Z
title: Gpg
---

How to export a public key?
---------------------------

Instruction given by keybase

```shell
# tip: first list your keys in GPG
gpg -K --keyid-format long --with-colons --with-fingerprint

# then export the *public key* you want (look next to `fpr`)
gpg --export -a 43DE59216E24EBFD579EE1A1463457FA61F15AA8

# then export the *private key* you want (look next to `fpr`)
gpg --export-secret-keys -a 43DE59216E24EBFD579EE1A1463457FA61F15AA8
```



Export and import all keys
---------------

```shell
gpg --export-secret-keys > my-secret-keyring.gpg
gpg --export-options export-local-sigs --export > my-public-keyring.gpg

# Reimport the keys
gpg --import my-secret-keyring.gpg
gpg --import-options import-local-sigs my-public-keyring.gpg

# Export one particular key
https://www.debuntu.org/how-to-importexport-gpg-key-pair/
```


```shell
gpg -K --keyid-format long --with-colons --with-fingerprint

# List of all keys that I have the private key
gpg --list-secret-keys --keyid-format LONG

# tip: first list your keys in GPG
gpg -K --keyid-format long --with-colons --with-fingerprint

# then export the one you want (look next to `fpr`)
gpg --export -a A4AA3A5BDBD40EA549CABAF9FBC07D6A97016CB3

# Export my current gpg key
gpg --armor --export 50A6DC2BBC6980D5

keybase -m
# To track someone

keybase track cognifloyd
```

Export Private keys

```sh
gpg --export-secret-keys 7394D52D7F9ED8DF0C0ABA17D43FED42264F4DE7 > my-private-fabien-udriot-visol.asc
gpg --export-secret-keys D5AE55E2FC0F29FC4250C9924597C4E300493ED5 > my-private-fabien-udriot-typo3.asc
gpg --export-secret-keys 3FD7789FD0158811EC37BF20CB19DB9BAB632A27 > my-private-fabien-omic.asc
gpg --export-secret-keys B4CD647008FB6A0DD41E2E849A39BDC5D4307BC7 > my-private-fabien-udriot.asc
gpg --export-secret-keys D31E935A1F6EDF24DCACF40450A6DC2BBC6980D5 > my-private-fabien-ecodev.asc
gpg --export-secret-keys 55FEFFD297E015B7BD5689718AA645518485AEC8 > my-private-fabien-hemmer.asc
```

Import my private keys

```bash
# All keys are here
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/18-10/my-secret-keyring.gpg 

# Import key individually
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-ecodev.asc
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-hemmer.asc
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-omic.asc
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-udriot.asc
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-udriot-typo3.asc
gpg --import ~/pCloudDrive/Crypto\ Folder/FabienIdentity/gpg/my-private-fabien-udriot-visol.asc
```




```shell
Get a public key, safely, starting just with someone's social media username
https://keybase.io/cognifloyd
https://gpgtools.org/

gpg --list-keys --list-options show-uid-validity
```

List all key
------------

```shell
gpg --list-keys
```

path: 

Backup or transfer your keys
============================

<http://support.gpgtools.org/kb/faq-gpg-keychain-access/backup-or-transfer-your-keys#3-backup-your-gnupg-folder-hacker-approach->

Trousseau
=========

Trousseau is a gpg encrypted key-value store designed to be a simple, safe andtrustworthy place for your data.

<https://github.com/oleiade/trousseau/blob/master/README.md>
@Steffen: Maybe a replacement for encrypted databags or even for keepass?

Key server
==========

<http://keys.gnupg.net/pks/lookup?search=udriot&op=index&fingerprint=on>

Public Key
==========

<http://keys.gnupg.net/pks/lookup?op=get&search=0x17A4173B198A84A1>

