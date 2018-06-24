#!/bin/bash

helm repo update

# non-rbac
#helm install stable/nginx-ingress --namespace kube-system --set rbac.create=false --set rbac.createRole=false --set rbac.createClusterRole=false

# rbac
helm install stable/nginx-ingress --namespace kube-system --set rbac.create=true --set rbac.createRole=true --set rbac.createClusterRole=true

helm install stable/kube-lego \
  --set config.LEGO_EMAIL=tim.webster@gmail.com \
  --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory \
  --set rbac.create=true