---
date: 2019-03-21T10:39:13.000Z
title: TYPO3 - Install
---

**Beta quality! Rework content**

## How to install TYPO3?

First we need to download the sources

```bash
# TYPO3 v9
mkdir typo3.lan; cd typo3.lan
composer require --ignore-platform-reqs -v typo3/cms-introduction:4.0 

# Remarks:
# 1. flag "--ignore-platform-reqs" is required if running >= PHP 7.4
# 2. typo3/cms-introduction has a dependency to bk2k/bootstrap-package
# 3. Checkout all depdendencies at
#    https://packagist.org/packages/typo3/cms-introduction

# TYPO3 v10
composer require typo3/cms-introduction

# TYPO3 v8
git clone https://github.com/TYPO3/TYPO3.CMS.BaseDistribution/tree/8.x (?)
composer require --ignore-platform-reqs typo3/cms-introduction ^3.0
```


```bash
php vendor/bin/typo3cms install:setup \
    --non-interactive \
    --database-user-name=root \
    --database-user-password=root \
    --database-host-name=127.0.0.1 \
    --database-port=3306 \
    --database-name=ebelaurorech \
    --admin-user-name=admin \
    --admin-password=password \
    --site-setup-type=ebelaurore.ch
```

Then we need to start a web server with the following commands

```bash
# Run in Development context
export TYPO3_CONTEXT=Development; php -S localhost:8000 -t public

# With fish shell
set TYPO3_CONTEXT Development; php -S localhost:8000 -t public

# Simply run the web server
php -S localhost:8000 -t public
```



## Typical composer.json

https://github.com/TYPO3/minimal

```
composer require typo3/minimal
```

## How can I sync my files with the production?

    rsync -av cuso:/sites/cuso.ch/htdocs/fileadmin htdocs/
    
    # Or with delete flag
    rsync -a --delete cuso:/sites/cuso.ch/htdocs/fileadmin htdocs/