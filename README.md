# argocd-public-demo

The target audience for this repo is people who are curious about Argo CD, but have never "touched" it before.

The purpose of this repo is to give them a super-easy method to quickly and easily see what its footprint is
in their own kubernetes cluster.

(I also have something similar for [FluxCD](https://github.com/ppbrown/fluxcd-public-demo) )

This will get argocd up and managing a trivial demo app, with just the simple commands given below. No need to set up github credentials, since this is a publically readable repo.

Do note that this demo is CLI focused. You can certainly follow through on the standard instructions to get the GUI
running, but I do not cover that here.

# Prerequisites

* You need your own fully working kubernetes cluster before trying to use this

# Installation

Note that you can either run this directly from this repo, or fork it to your own repo.
If you want to see Argo actually update from git changes, GitOps style, you should fork it and run from there.

## Prep

* If you are working from your own forked version of my repo, update the url in [argocd/application.yaml](argocd/application.yaml) if you haven't already
* Clone the repo to your workstation

## Install STEPS

    kubectl create ns argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

    # This doesnt actually changeo anything. It just gives you a specific milestone you can use to validate that
    # argocd properly installed
    kubectl -n argocd rollout status deploy/argocd-applicationset-controller --timeout=180s

    # Final "deploy this application through ArgoCD" step
    kubectl apply -f argocd/application.yaml

That's all there is! 

If you are working from a forked version of this repo, any changes to it will automatically be picked up by Argo and activated in your cluster after a minute or two.

# Demo Application Status

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


# Demo Application webpage

If you want to see the actual webpage served by the demo app, you can use the typical k8s ways to expose the service.
Or if you are new to kubernetes, here's how to view it forwarded to your local workstation only:

    kubectl -n demo-app port-forward svc/demo-app 8888:8888

You may then point your desktop browser to   `http://localhost:8888` and you should see the simple output,

"Started by ArgoCD"



