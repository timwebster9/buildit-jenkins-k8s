#!/bin/bash

RG_NAME=timw-aks-rg
LOCATION=uksouth
AKS_CLUSTER_NAME=timw-aks-cluster
NODE_COUNT=3
NODE_VM_SIZE=Standard_D2s_v3
KUBERNETES_VERSION=1.9.6

# create resource group
az group create --name $RG_NAME --location $LOCATION

# create AKS cluster
az aks create --resource-group $RG_NAME \
              --name $AKS_CLUSTER_NAME \
              --node-count $NODE_COUNT \
              --node-vm-size $NODE_VM_SIZE \
              --kubernetes-version $KUBERNETES_VERSION \
              --location $LOCATION \
              --enable-rbac \
              --generate-ssh-keys

# remove old config
kubectl config delete-cluster timw-aks-cluster
kubectl config delete-context timw-aks-cluster

# add new config
az aks get-credentials --resource-group timw-aks-rg --name timw-aks-cluster