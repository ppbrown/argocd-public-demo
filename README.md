# argocd-public-demo

*Work in progress*

This repo probably does not work yet. It's untested, anyway.

The intent is to have something similar to my [fluxcd-public-demo](https://github.com/ppbrown/fluxcd-public-demo) but for argocd

The idea is to get an instance of ArgoCD running, along with a demo app, with the absolute minimum amount of effort,
to allow people who have never seem it running to have something to poke it.

# Prerequisites

* You need your own fully working kubernetes cluster before trying to use this
* You need a linux machine to run the install scripts

# Installation

(Note that you can either run this directly from this repo, or fork it to your own repo)

1. Clone the repo to your workstation
2. If you are cloning from a fork, update the url in argocd/application.yaml if you havent already
3. bash install/10-install-argocd.sh
4. bash install/20-bootstrap-app.sh 


That's all there is!
