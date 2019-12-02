---
date: 2019-03-21T10:39:13.000Z
title: Docker - PHP
---

## How can I build a PHP container?

Check my Gist:

https://gist.github.com/fabarea/8ccc2f079b57dbf465f30583638f91e6

## How can I enable PHP extension?

```sh
$> docker-php-ext-configure 
usage: /usr/local/bin/docker-php-ext-configure ext-name [configure flags]
   ie: /usr/local/bin/docker-php-ext-configure gd --with-jpeg-dir=/usr/local/something

Possible values for ext-name:
bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mssql mysql mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sybase_ct sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip

$> docker-php-ext-install 
usage: /usr/local/bin/docker-php-ext-install ext-name [ext-name ...]
   ie: /usr/local/bin/docker-php-ext-install gd mysqli
       /usr/local/bin/docker-php-ext-install pdo pdo_mysql

if custom ./configure arguments are necessary, see docker-php-ext-configure

Possible values for ext-name:
bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mssql mysql mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets spl standard sybase_ct sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip
```