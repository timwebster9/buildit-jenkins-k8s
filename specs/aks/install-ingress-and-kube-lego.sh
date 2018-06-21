#!/bin/bash

# Installs Helm (i.e. Tiller on server), nginx-ingress and kube-lego (non--RBAC)
# https://docs.microsoft.com/en-us/azure/aks/ingress

# install tiller for new clusters
helm init

helm repo update

helm install stable/nginx-ingress --namespace kube-system --set rbac.create=false --set rbac.createRole=false --set rbac.createClusterRole=false

helm install stable/kube-lego \
  --set config.LEGO_EMAIL=tim.webster@gmail.com \
  --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory