#!/bin/bash

# Installs Helm (i.e. Tiller on server), nginx-ingress and kube-lego
# https://docs.microsoft.com/en-us/azure/aks/ingress

kubectl apply -f helm-tiller-rbac.yaml

# install tiller for new clusters
helm init --service-account tiller