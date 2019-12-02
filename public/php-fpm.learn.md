---
title: PHP - FPM
---

cat /etc/php5/fpm/pool.d/introduction.typo3cms.demo.typo3.org.conf | grep -v ^\\;

netstat -tapn | grep 900 | grep LISTEN