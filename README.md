# argocd-public-demo

The purpose of this repo is to give people who are curious about ArgoCD, a way to quickly and easily try it out in their
own kubernetes cluster, with a minimum of setup hassle.
(I also have something similar for [FluxCD](https://github.com/ppbrown/fluxcd-public-demo) )

You can get argocd running a trivial demo app, with just two simpple commands given below

# Prerequisites

* You need your own fully working kubernetes cluster before trying to use this
* You need a linux machine to run the install scripts

# Installation

Note that you can either run this directly from this repo, or fork it to your own repo.
If you want to see Argo actually update from git changes GitOps style, you should fork it and run from there.

## Prep
*  Clone the repo to your workstation
* If you have cloned the repo to your own forked one, update the url in argocd/application.yaml if you have'nt already

## Install scripts
3. bash install/10-install-argocd.sh
4. bash install/20-bootstrap-app.sh 


That's all there is!

# Status

ArgoCD has its own built in GUI (automatically installed), and an optional CLI (which you have to install manually)

However, if you just want a quick peek at the situation, you can always just use ye olde kubectl:

    kubectl -n demo-app get all
    
    NAME                            READY   STATUS    RESTARTS   AGE
    pod/demo-app-74c957b7dd-6ftff   1/1     Running   0          24m

    NAME               TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
    service/demo-app   ClusterIP   10.109.15.63   <none>        8888/TCP   24m

    NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
    deployment.apps/demo-app   1/1     1            1           24m

    NAME                                  DESIRED   CURRENT   READY   AGE
    replicaset.apps/demo-app-74c957b7dd   1         1         1       24m

(Keep in mind that it has the actual argocd services in the `argocd` namespace. Unlike
 [FluxCD](https://github.com/ppbrown/fluxcd-public-demo) there are a lot of them)
