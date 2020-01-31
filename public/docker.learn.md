---
date: 2019-03-22T17:12:50.000Z
public: true
title: Docker
---

Docker life cycle
----------

```sh
# Building image
# --rm       Remove intermediate containers after a successful build (default true)
# --no-cache Do not use cache when building the image

docker build --rm -t fab1en/doxygen .
docker build --rm -t fab1en/doxygen:1.0.0 .
docker build --no-cache=true -t fab/doxygen .

# Show all images
docker images
docker rmi fab1en/doxygen:1.0.0

# Run container
# --rm Automatically remove the container when it exits
docker run -it --rm ubuntu:14.04

# Show docker process
docker ps -a

docker-kill-all

docker-clean-containers

docker run -it -p 49800:80 -p 49801:6081 fudriot/drupal /bin/bash
docker run -it -p 8080:80 -p 49801:6081 fudriot/drupal supervisord

# Export container data
docker export

# Push the built image. Can be pushed straight after building.
docker push fab1en/athenapdf # equivalent to fab1en/athenapdf:latest
docker push fab1en/athenapdf:1.0.0

# Tag an image. This will create an image ready to push.
docker tag local-image:tagname new-repo:tagname

# Commit a container. This will create an "image" from the container ready to be pushed
docker commit -a "Author" local-container fab1en/doxygen
docker push fab1en/doxygen

tail -f /var/log/supervisor/supervisord.log 
```

Restart automatically
---------------------

```
docker update --restart=no my-container
docker update --restart=always my-container
```

The info is in `/var/lib/docker/container/hostconfig.json`

check for `RestartPolicy.Name = "always"`

How to run Portainer?
---------------------

```sh
docker run -d -v "/var/run/docker.sock:/var/run/docker.sock" -p 9000:9000 --name portainer portainer/portainer
```

What possible tag to build a Debian image?
------------------------------------------

See possible tags https://hub.docker.com/_/debian

```sh
# 8 == jessie
# 9 == stretch
# 10 == buster
FROM debian:8
# Would be equivalent to:
FROM debian:jessie
```

How can I enter container ?
---------------------------

We should used  `exec` instead of `run`. The command "run" will create a new container whereas "exec" will be used to manipulate a running instance. 

```sh
# Selenium
docker-compose exec selenium-chrome /bin/bash
sudo su

# if CMD["/bin/bash"] we can omit the shell
docker run -it --rm debian

# With docker-compose. Assuming "db" is the service name
docker-compose exec db bash
docker-compose exec db su www-data

# If the container has an entry point we must override it, for instance:
docker run --entrypoint "sh" -it --rm marpteam/marp-cli
```

Dockerizing a Node.js web app
-----------------------------

```sh
docker build -t <your username>/node-web-app .
docker images
docker run -p 49160:8080 -d <your username>/node-web-app
docker logs <container id>
docker exec -it <container id> /bin/bash
curl -i localhost:49160
```

<https://nodejs.org/en/docs/guides/nodejs-docker-webapp/>

Edit files in Docker containers
-------------------------------

1.  based on zed but didn't fully worked
    <http://blog.sequenceiq.com/blog/2014/09/24/edit-files-docker/>

2.  Did not test: you find yourself editing nginx config files? Don’t do it, use the great generic nginx appliance from Jeff Lindsay
    <https://github.com/progrium/nginx-appliance>

3.  Other solution from Blog


    docker run -v /usr/local/bin:/target jpetazzo/nsenter
    PID=$(docker inspect --format {{.State.Pid}} htdocs_web_1)
    nsenter --target $PID --mount --uts --ipc --net --pid

<http://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-in-docker/>

    create an alias
    docker-enter() { PID=$(docker inspect --format {{.State.Pid}} "$@"); nsenter --target $PID --mount --uts --ipc --net --pid;}

Docker Explained: How To Containerize and Use Nginx as a Proxy
--------------------------------------------------------------

<https://www.digitalocean.com/community/tutorials/docker-explained-how-to-containerize-and-use-nginx-as-a-proxy>

OpenVPN on docker
-----------------

with upstream daemon explained
<https://www.digitalocean.com/community/tutorials/how-to-run-openvpn-in-a-docker-container-on-ubuntu-14-04>

How To Dockerise And Deploy Multiple WordPress Applications On Ubuntu
---------------------------------------------------------------------

* with memory limit
* with different port
* example of reverse proxy in the comments
* question of volumes
<https://www.digitalocean.com/community/tutorials/how-to-dockerise-and-deploy-multiple-wordpress-applications-on-ubuntu>

Docker-gen
----------

docker-gen is a file generator that renders templates using docker container meta-data.

There are three common ways to run docker-gen:

    on the host
    bundled in a container with another application
    separate standalone containers

<https://github.com/jwilder/docker-gen>

Fully integrate containers in your network.
-------------------------------------------

<https://github.com/xlucas/docker-flatip#adding_ip>

Persistent volumes with Docker - Data-only container pattern
------------------------------------------------------------

<http://container42.com/2013/12/16/persistent-volumes-with-docker-container-as-volume-pattern/>

What is the difference between CMD and ENTRYPOINT?
---------------------------------

* CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs.

```sh
CMD ["/bin/sh"]
```

* ENTRYPOINT configures a container that will run as an executable.

```sh
ENTRYPOINT ["redis", "-H", "something", "-u", "toto"]
ENTRYPOINT ["/athenapdf-service/conf/entrypoint.sh"]
```

Examples of Docker configuration for TYPO3 CMS
--------

Docker based TYPO3 Installation based on composer

<https://github.com/dkd/docker-typo3>

<https://registry.hub.docker.com/u/hbokh/docker-typo3-cms-wheezy/>

<https://registry.hub.docker.com/u/dkdde/typo3/>

<https://registry.hub.docker.com/u/hbokh/docker-typo3-cms/> (with github)
<https://github.com/million12/docker-typo3-flow-neos-abstract> (with github)

What Challenges to Avoid when Migrating to Docker
-------------------------------------------------

<http://logz.io/migrating-to-docker/>

Virtualization VS containerization
<http://containerz.blogspot.ch/2015/03/virtualization-vs-containerization.html>

A Not Very Short Introduction to Docker
---------------------------------------

<http://anders.janmyr.com/2015/03/a-not-very-short-introduction-to-docker.html>

How to inspect the container?
-------

```sh
# Tell the image used to build the container
docker inspect -f "{{ .Config.Image }}" web

# Tell the IP address of the given container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web
```

How do I know the IP of the 

How to remove all stopped containers?
------------------------------

```
docker rm $(docker ps -a -q)
```

How to remove all untagged images?
--------------------------

```
docker rmi $(docker images | grep "^<none>" | awk "{print $3}") 
```

Detach / attach
---------------

```
docker run -d CONTAINER

docker attach NAME (?)
docker attach --sig-proxy=false NAME 
but I cannot exit it, not with CTRL-C, nor with CTRL-P + CTRL-Q (like suggested in the similar question above)

To recap:
docker run -t -i → can be detached with ^P^Q and reattached with docker attach
docker run -i → cannot be detached with ^P^Q; will disrupt stdin
docker run → cannot be detached with ^P^Q; can SIGKILL client; can reattach with docker attach
```

Port forwarding
---------------

You can do it temporarily, using ssh:

boot2docker ssh -L 8000:localhost:8000

or you can set up a permanent VirtualBox NAT Port forwarding:

VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8000,tcp,,8000,,8000";

<https://github.com/boot2docker/boot2docker/blob/master/doc/WORKAROUNDS.md>

Dockerignore
------------

.dockerignore is to prevent files from being added to the initial build context that is sent to the docker daemon when you do docker build, it doesn't create a global rule for excluding files from being created in all images generated by a Dockerfile.

It's important to note that each RUN statement will generate a new image, with the parent of that image being the image generated by the Dockerfile statement above it. Try collapsing your RUN statements into a single one to reduce image size:

```
RUN librarian-puppet install &&\\
```

Docker Networking 101 – The defaults
------------------------------------

<http://www.dasblinkenlichten.com/docker-networking-101/>

PHP-FPM in Docker
-----------------

<http://blog.famillecollet.com/post/2014/12/11/PHP-FPM-in-Docker>

How to Optimize Your Dockerfile
-------------------------------

<http://blog.tutum.co/2014/10/22/how-to-optimize-your-dockerfile/>

Docker Global Hack Day: Fig Demo'd by Daniel Nephin of Yelp
-----------------------------------------------------------

<https://www.youtube.com/watch?v=bYfwFkeeUL4> (example with wreathedocs)

Introduction to Dockerfiles
---------------------------

<http://formatccolon.com/introduction-to-dockerfiles/?utm_source=Docker+News&utm_campaign=3432c436f6-Docker_Weekly_November_12th_201411_11_2014&utm_medium=email&utm_term=0_c0995b6e8f-3432c436f6-235802529>

Deploying Go servers with Docker
--------------------------------

<http://blog.golang.org/docker>

CoreOS se paye Quay.io, un référentiel privé pour les conteneurs Docker
<http://www.silicon.fr/coreos-se-paye-quay-io-referentiel-prive-les-conteneurs-docker-96142.html>

système de packaging qui permet de prendre n’importe quel code source, n’importe quelle application et de l’envelopper, avec toutes ses dépendances, dans un objet unique
<http://www.silicon.fr/docker-google-federe-alliance-anti-aws-96219.html>

JoliCi - Run your TravisCi builds locally
-----------------------------------------

<https://github.com/jolicode/JoliCi>

Lessons learned after "Dockerizing" a Rails app.
------------------------------------------------

<http://danielmartins.ninja/posts/a-week-of-docker.html

La folie Docker
---------------

<http://linuxfr.org/news/la-folie-docker>

<http://ippon.developpez.com/tutoriels/virtualisation/docker-presentation-part-2/>

Terminology
-----------

container -> volume
template 


Alternative as supervisord?
---------------------------

<http://blog.sequenceiq.com/blog/2014/05/09/building-the-build-environment-with-ansible-and-docker/>

Example:

<https://github.com/ricardoamaro/docker-drupal>

<https://github.com/tutumcloud/tutum-docker-mysql>

Je ne l'ai pas mis dans la news mais notre dernier jouet à la mode c'est Docker, si vous voulez tester du Tuleap dans du Docker c'est:
$> docker run -ti -e VIRTUAL_HOST=localhost -p 80:80 -p 443:443 -p 22:22 -v /srv/docker/pink:/data enalean/tuleap-aio
Plus d'info sur l'index docker
On essaye de documenter nos trouvailles ici sur le blog

<http://www.enalean.com/en/Pack-Tuleap-in-Docker-container-part-1

How to Manage your Docker Image
===============================

<https://gist.github.com/wsargent/7049221>

<https://portal-hoth.basespace.illumina.com/docs/content/documentation/native-apps/manage-docker-image>

Effortless Docker-in-a-box for unsupported Docker platforms, like the Mac
=========================================================================

<http://fnichol.github.io/dvm/>

```
brew cask install vagrant    --appdir=/Applications
brew cask install virtualbox --appdir=/Applications
```

Gérer les containers avec Docker
--------------------------------

<http://linuxfr.org/news/gerer-les-containers-avec-docker>

SSH HostKeys Plugin for Dokku
Manage hostkeys (for .ssh/known_hosts) to your container environment

<https://github.com/cedricziel/dokku-hostkeys-plugin>

Pack2er
------

What Is Packer?
Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. 

<http://www.packer.io/downloads.html>

<https://github.com/datenbetrieb/packer-boxdefinitions>

Drupal on Docker
----------------

<http://robknight.org.uk/blog/2013/05/drupal-on-docker/>

Deploying django using docker
-----------------------------

<http://agiliq.com/blog/2013/06/deploying-django-using-docker/>
