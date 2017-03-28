# Helloworld

This repo is a guide on how to:

 * develop microservices
 * and deploy them to Google Container Engine

We build a [Go](https://golang.org/) web server that replies: "Hello world" and can be deployed to
[Google Container Engine](https://cloud.google.com/container-engine/).

#### Intro Course
This guide builds upon this Udacity course:
* [Scalable Microservices with Kubernetes - ud615](https://www.udacity.com/course/scalable-microservices-with-kubernetes--ud615)
* [My Repo](https://github.com/unders/udacity-kubernetes)


## Tutorial

```
$ mkdir -p $GOPATH/src/github.com/unders
$ cd $GOPATH/src/github.com/unders
$ git clone https://github.com/unders/helloworld
$ cd helloworld
$ make               # and follow the steps in the tutorial
```

## Resources

### People
 * [@kelseyhightower](https://twitter.com/kelseyhightower)
 * [@_askcarter](https://twitter.com/_askcarter)

### Repos
* [](https://github.com/GoogleCloudPlatform/golang-samples/tree/master/appengine_flexible/endpoints/)
* [kelseyhightower/gke-service-accounts-tutorial](https://github.com/kelseyhightower/gke-service-accounts-tutorial)
* [kelseyhightower/gif-maker](https://github.com/kelseyhightower/gif-maker)
* [kelseyhightower/gif-maker-infrastructure](https://github.com/kelseyhightower/gif-maker-infrastructure)
* [kelseyhightower/kubernetes-cluster-federation](https://github.com/kelseyhightower/kubernetes-cluster-federation)
* [kelseyhightower/craft-kubernetes-workshop](https://github.com/kelseyhightower/craft-kubernetes-workshop)
* [kelseyhightower/google-cloud-next-17](https://github.com/kelseyhightower/google-cloud-next-17)
* [kelseyhightower/kube-cert-manager](https://github.com/kelseyhightower/kube-cert-manager)
* [kelseyhightower/cross-gke-cluster-networking](https://github.com/kelseyhightower/cross-gke-cluster-networking)
* [kelseyhightower/app - 12 factor](https://github.com/kelseyhightower/app)

### Books
 * [Kubernetes: Up and Running - 2015](http://shop.oreilly.com/product/0636920043874.do)
 * [Building Microservices - 2015](http://shop.oreilly.com/product/0636920033158.do)

### Articles
* [12 Fractured Apps - 2015 dec](https://medium.com/@kelseyhightower/12-fractured-apps-1080c73d481c#.420yimd9l)
* [Microservice Trade-Offs - 2015 July](https://martinfowler.com/articles/microservice-trade-offs.html)
* [Microservices Resource Guide](https://martinfowler.com/microservices/)
* [Microservices - a definition of this new architectural term](https://martinfowler.com/articles/microservices.html)

### Videos
* [GOTO 2014 • Microservices • Martin Fowler](https://www.youtube.com/watch?v=wgdBVIX9ifA)
* [Orchestrating with Kubernetes - 2016](https://www.youtube.com/watch?v=21hXNReWsUU)
* [The State of the Art in Microservices by Adrian Cockcroft - 2015](https://www.youtube.com/watch?v=pwpxq9-uw_0)

### Tools
* [Go](https://golang.org/)
* [Docker](https://www.docker.com/)
* [Kubernetes](https://kubernetes.io/)
* [Google Container Engine (GKE) - a hosted Kubernetes service](https://cloud.google.com/container-engine/)

## Kubernetes
* [running-mongodb-on-kubernetes-with-statefulsets](http://blog.kubernetes.io/2017/01/running-mongodb-on-kubernetes-with-statefulsets.html)
* [StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

## Google Cloud Platform
* [Google Container Engine](https://cloud.google.com/container-engine/)
* [GCP - load-balancing/ipv6](https://cloud.google.com/compute/docs/load-balancing/ipv6)
* [Google Application Default Credentials](https://developers.google.com/identity/protocols/application-default-credentials)

### ???
 * Deployment Manager
 * Google Cloud Key Management Service

