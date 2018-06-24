#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ./deploy-jenkins.sh <startup secret>"
fi

SECRECT=$1

kubectl apply -f buildit-jenkins-namespace.yaml
kubectl create secret generic jenkins-startup-secret --from-literal=JENKINS_STARTUP_SECRET=$SECRECT -n buildit-jenkins
kubectl apply -f buildit-jenkins.yaml