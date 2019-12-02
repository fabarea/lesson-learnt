---
title: PHP - Composer
---

Plugin composer
---------------

<https://github.com/hirak/prestissimo>

    composer global require hirak/prestissimo

Update certificate
==================

composer config -d=. --global cafile '/usr/local/etc/openssl/cert.pem'

In composer.json
================

  "replace": {
    "parsedown": "self.version",
    "typo3-ter/parsedown": "self.version"
  },

Checking dependencies for bad patterns
======================================

composer validate -A --strict

<http://seld.be/notes/new-composer-patterns?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+php-blog-seld+%28Seld.be+%3E+Blog+%3E+PHP%29>

Excluding paths from the optimized classmap
===========================================

composer dump-autoload -o
composer dump-autoload --optimized

"autoload": {
    "psr-4": { "Nelmio\\CorsBundle\\": "" },
    "exclude-from-classmap": ["/Tests/"]
},

<http://seld.be/notes/new-composer-patterns?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+php-blog-seld+%28Seld.be+%3E+Blog+%3E+PHP%29>

Post script
-----------

    "scripts": {
        "post-autoload-dump": "Helhum\\ClassAliasLoader\\Composer\\ClassAliasGenerator::generateAliasMap" 
    },

Here was the commands I run on repository <https://git.typo3.org/TYPO3CMS/Distributions/Base.git> for the 6.2.8 release: <https://git.typo3.org/Packages/TYPO3.CMS.git>

Make sure to have the Gerrit Hook!

        -> edit composer.json with 6.2.11
        git diff
        git ci -am "[TASK] Update composer.json for 6.2.11"
        git tag 6.2.11
        -> edit composer.json with dev-master
        git diff
        git ci -am "[TASK] Update composer.json for master"
        git push or git review
        git push --tags

Slides - You thought Composer couldn't do that?
-----------------------------------------------

<http://www.naderman.de/slippy/src/?file=2012-11-22-You-Thought-Composer-Couldnt-Do-That.html>

composer show --platform
composer show --installed

\-> force update
<https://packagist.org/packages/typo3/cms-base-distribution>

Composer
--------

composer install --ignore-platform-reqs

On Review
---------

<https://review.typo3.org/#/admin/groups/64,members> (Leader, required for pushing tag?)
<https://review.typo3.org/#/admin/groups/471,members>

Composer & virtual packages
---------------------------

<http://devedge.wordpress.com/2014/09/27/composer-and-virtual-packages/>

Personal Packagist with Toran Proxy
-----------------------------------

<http://www.sitepoint.com/personal-packagist-toran-proxy/>

does anyone know if it is possible to require TYPO3 6.2 "dev" with composer?
"typo3/cms": "dev-TYPO3_6-2"

Install composer globally
=========================

    brew update
    brew tap homebrew/homebrew-php
    brew tap homebrew/dupes
    brew tap homebrew/versions
    brew install php55-intl
    brew install homebrew/php/composer

Using Composer Without GitIgnoring Vendor
-----------------------------------------

<http://www.lornajane.net/posts/2014/using-composer-without-gitignoring>

Use composer to quickly initialize your TYPO3 projects
======================================================

<http://blog.cedric-ziel.com/articles/creating-a-typo3-installation-by-composer/>

have composer update get latest version from git repo
-----------------------------------------------------

<http://stackoverflow.com/questions/14595772/have-composer-update-get-latest-version-from-git-repo>

Composer - Package Management for PHP. Silver Bullet?
-----------------------------------------------------

<http://www.slideshare.net/chebba/composer-package-management-for-php-silver-bullet>

minimum-stability (root-only)
-----------------------------

This defines the default behavior for filtering packages by stability. This defaults to stable, so if you rely on a dev package, you should specify it in your file to avoid surprises.

    "minimum-stability": "dev"

option --dev
------------

    "require-dev": {
        "phpunit/phpunit": "3.7.*"
    }

composer/installers
-------------------

    {
        "config": {
            "vendor-dir": "lib/vendor"
        },
        "repositories": {
            "symfony": {
                "type": "package",
                "package": {
                    "name": "symfony/symfony1",
                    "version": "1.4",
                    "dist": {
                        "url": "https://github.com/symfony/symfony1/zipball/1.4",
                        "type": "zip"
                    }
                }
            },
            "sfResquePlugin" : {
                "type": "package",
                "package": {
                    "name": "devpips/sfResquePlugin",
                    "type": "symfony1-plugin",
                    "version": "0.1",
                    "dist": {
                        "url": "https://github.com/devpips/sfResquePlugin/zipball/master",
                        "type": "zip"
                    }
                }
            }
        },
        "require": {
            "composer/installers": "dev-master",
            "symfony/symfony1": "1.4",
            "devpips/sfResquePlugin":"0.1"
        }
    }

File
----

packages.json (local)
composer.json (server)

Example: 
<http://ci.typo3.robertlemke.net/job/composer-packages/ws/repository/packages.json>

<http://etobi.de/composer/packages.json>

With custom installer path
{
    "require": {
        "composer/installers": "\*",
        "typo3/cms-rss_display": "dev-master"
    },
    "extra": {
        "installer-paths": {
            "htdocs/typo3conf/ext/{$name}/": [
                "typo3/cms-rss_display"
            ]
        }
    }
}

Part 1 – What & Why
-------------------

<http://nelm.io/blog/2011/12/composer-part-1-what-why/>

Talking about Composer, a package manager for PHP
-------------------------------------------------

<http://blog.andho.com/2011-12-23/talking-about-composer-a-package-manager-for-php/>

Composer - Package Management for PHP. Silver Bullet?
-----------------------------------------------------

<http://www.slideshare.net/chebba/composer-package-management-for-php-silver-bullet> (shared slides)