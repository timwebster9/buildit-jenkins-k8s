#!/bin/bash

RG_NAME=timw-aks-rg
AKS_CLUSTER_NAME=timw-aks-cluster

az aks delete --name $AKS_CLUSTER_NAME --resource-group $RG_NAME