---
date: 2019-11-21T12:51:39+01:00
title: Kubernetes - MicroK8s
---

Testing new tools and taking notes of my success / failures...

<!-- more -->

My Next questions?
==================



* How to install Helm?

  **Attention!** It looks we must enable `helm` service in microk8s.helm

* How to configure my domain with Ingress? To be further tested. We have ingress.yaml file to be continued...

  Continue reading: https://hackernoon.com/expose-your-kubernetes-service-from-your-own-custom-domains-cc8a1d965f

* How to add an ssl certificate with Ingress

  https://docs.bitnami.com/kubernetes/how-to/secure-kubernetes-services-with-ingress-tls-letsencrypt/

  https://kubernetes.github.io/ingress-nginx/user-guide/tls/

  

Is Kubernetes the right tool?
-----------------------------

I am still experimenting and haven't decided yet if the overhead is worth the benefit. I am experimenting with [MicroK8s](https://microk8s.io/) which looks promising in term of simplicity. Ideally I would like to also have it running on my local machine. While testing I am aiming to set up the following **basic** features:

* Setup a frontend http server to serve / proxy my applications. Ingress controller! 

- SSL certificate managed by [Let's Encrypt](https://letsencrypt.org/).

The installation process is quick and straightforward. I am following this tutorial [the online tutorial](https://tutorials.ubuntu.com/tutorial/install-a-local-kubernetes-with-microk8s#2) provided by Ubuntu. It is well done and user-friendly to follow.

How do I install heml and microk8s?
-----------------------------------

``` bash
snap install microk8s --classic
snap install helm --classic
```

Pay attention a few `ufw` must be enabled. 

Can you show me basic and daily commands?
----------------------------------------

Useful commands from the microk8s tutorial:

```bash
# Create an alias to kubectl. Useful for my case since I am running solely mircok8s
snap alias microk8s.kubectl kubectl

# List a bunch of enabled / disabled services
microk8s.status

# Enable a few addons: dashboard + dns
microk8s.enable dns
microk8s.enable dashboard

# Big overview of the system
# We can see IP address

kubectl get all --all-namespaces

# For now we only have private IP address.
# If we want to access the dashboard we need to open a ssh tunnel
# REPLACE IP 10.152.183 by the one displayed by the command above
ssh pco2new -L 1443:10.152.183.1:443 -L 16443:127.0.0.1:16443

# Show URLs
kubectl cluster-info

# To display the username / password
kubectl config view
microk8s.config (alternative)

# Open the browser with tunnel enabled
https://127.0.0.1:16443 (API - Kubernetes master is running)
https://127.0.0.1:16443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
CoreDNS is running at 

# Credentials that will be asked when loading the IP:443
token=$(microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s.kubectl -n kube-system describe secret $token
```

How to deploy a service "microbot" example?
-------------------------------------------

We want do deploy a kind of "hello world" service

```bash
# Create the application
kubectl create deployment microbot --image=dontrebootme/microbot:v1
kubectl scale deployment microbot --replicas=2
kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service

# Check on which IP / port the pod was started
microk8s.kubectl get all --all-namespaces

# Useful commands
kubectl get namespaces

kubectl get all
kubectl get all --all-namespaces

kubectl get nodes # should be 1 with microk8s

kubectl get pods
kubectl get pods --output=wide

kubectl get deployments
kubectl describe deployments microbot

kubectl get replicasets
kubectl describe replicasets

kubectl get services
kubectl describe service microbot-services
```

How to deploy a service "hello-world" example?
----------------------------------------------

```bash
kubectl run hello-world --replicas=5 --labels="run=load-balancer-example" --image=gcr.io/google-samples/node-hello:1.0  --port=8080

# or
kubectl apply -f https://k8s.io/examples/service/load-balancer-example.yaml
```

Rest of the tutorial:

https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/

How do I expose a service?
--------------------------

Exposing means accessible from the "outside". There are various ways actually. One would be the `LoadBalancer`. Notice however this  **will not work** with Microk8s since it is not a Kubkernetes Cloud provider. You will end up with a "external IP pending" error.

```bash
kubectl expose deployment hello-world --type=LoadBalancer --name=my-service
kubectl get services
```

Why do I get a external IP "pending" ?
--------------------------------------

In this case, there is no LoadBalancer integrated (unlike AWS or Google Cloud). With this default setup, you can only use [`NodePort`](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport) or an Ingress Controller.

Source:

https://stackoverflow.com/questions/44110876/kubernetes-service-external-ip-pending

How do I enable Ingress on MicroK8s?
------------------------------------

**Pay attention** the URL to install and download Ingress via  `mandatory.yaml` has changed from the tutorial. Read the doc here! Kubernetes chaos moving target it seems...

https://github.com/nginxinc/kubernetes-ingress/blob/master/docs/installation.md

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml

# We could also install it via it seems 
helm install stable/nginx-ingress

# Special command for microsk8s
microk8s.enable ingress
```

Source:

https://kndrck.co/posts/microk8s_ingress_example/

https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-ingress-guide-nginx-example.html

How to uninstall / remove 
--------------------------

```bash
kubectl delete namespace ingress-nginx
```

There could be more steps if Prometheus is involved.

Where do I find my configuration file?
--------------------------------------

When using `Microk8s`

```bash
nano /var/snap/microk8s/current/args/kube-apiserver
```

How can I delete an application?
--------------------------------

```
kubectl delete services my-service
kubectl delete deployment hello-world
```

What are service types?
-----------------------

* `ClusterIP`: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default `ServiceType`.
* [`NodePort`](https://kubernetes.io/docs/concepts/services-networking/service/#nodeport): Exposes the Service on each Node’s IP at a static port (the `NodePort`). A `ClusterIP` Service, to which the `NodePort` Service routes, is automatically created. You’ll be able to contact the `NodePort` Service, from outside the cluster, by requesting `:`.
* [`LoadBalancer`](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer): Exposes the Service externally using a cloud provider’s load balancer. `NodePort` and `ClusterIP` Services, to which the external load balancer routes, are automatically created.

Source:

https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types