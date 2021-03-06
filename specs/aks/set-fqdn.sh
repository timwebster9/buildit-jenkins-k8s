#!/bin/bash

# Sets public DNS name for ingress controller
# https://docs.microsoft.com/en-us/azure/aks/ingress

# Get IP address of Ingress from:
# kubectl get service -l app=nginx-ingress --namespace kube-system

if [ "$#" -ne 1 ]; then
    echo "Usage: ./set-fqdn.sh <IP ADDRESS>"
fi

# Public IP address
IP=$1

# Name to associate with public IP address
DNSNAME=timw-aks-ingress

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME