---
date: 2019-03-22T16:37:59.000Z
title: Docker - MariaDB and MySQL 
---

Example how to run a MariaDB / MySQL docker container.
 
MariaDB
=======

```
# We create a container called mariadb that is exposing port 22306

docker run --name mariadb -p 23306:3306 -e MYSQL_ROOT_PASSWORD=root -d mariadb/server
```

MySQL
=====

```
docker run -p 13306:3306 --name=mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.6
```