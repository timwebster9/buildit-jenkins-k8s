# Buildit Jenkins Kubernetes Deployments

## Prerequistes
* a running Kubernetes cluster
* nginx ingress controller 
* A Kubernetes secret

To create the secret:

    kubectl create secret generic jenkins-startup-secret --from-literal=JENKINS_STARTUP_SECRET=<your secret here>
