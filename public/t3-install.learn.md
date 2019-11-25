---
date: 2019-03-21T10:39:13.000Z
title: TYPO3 - Install
---

**Beta quality! Rework content**

There are various way to install TYPO3-

## Comment installer TYPO3?

- Clone du Core + ddev
  https://docs.typo3.org/m/typo3/guide-contributionworkflow/master/en-us/Appendix/SettingUpTypo3Ddev.html
  - Incovénient: à tester si on ne peut pas faire un require de "typo3/cms-introduction"
- Depuis composer.typo3.org, ensuite:

  - composer create-project typo3/cms-base-distribution CmsBaseDistribution ^9
  - Si nécessaire récupérer une composer d'une autre version
    https://github.com/TYPO3/TYPO3.CMS.BaseDistribution/
    `composer update` si nécessaire
  - ajouter / copier un ddev existant
    `cp -r ~/Work/Ecodev/graduatecampus/.ddev .`
  - composer require typo3/cms-introduction

- Depuis ce projet https://github.com/helhum/TYPO3-Distribution/
  - Inconvénient: opiniated distribution

TODO: DDEV... write something about it since I am using it intensively.

Boostrap Package
----------------

    # TYPO3 v9
    composer require bk2k/bootstrap-package
    composer require typo3/cms-introduction
    
    # TYPO3 v8
    
    git clone https://github.com/TYPO3/TYPO3.CMS.BaseDistribution/tree/8.x (?)
    
    composer require bk2k/bootstrap-package ^8.0
    composer require typo3/cms-introduction ^3.0


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

set TYPO3_CONTEXT Development php -S localhost:8000 -t public

## Typical composer.json

https://github.com/TYPO3/minimal

```
composer require typo3/minimal
```

## How can I sync my files with the production?

    rsync -av cuso:/sites/cuso.ch/htdocs/fileadmin htdocs/
    
    # Or with delete flag
    rsync -a --delete cuso:/sites/cuso.ch/htdocs/fileadmin htdocs/