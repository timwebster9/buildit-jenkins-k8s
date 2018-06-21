#!/bin/bash

# Sets public DNS name for ingress controller
# https://docs.microsoft.com/en-us/azure/aks/ingress

if [ "$#" -ne 2 ]; then
    echo "Usage: ./set-fqdn.sh <IP ADDRESS> <DNS PREFIX>"
fi

# Public IP address
IP=$1

# Name to associate with public IP address
DNSNAME=$2

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME